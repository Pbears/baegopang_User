package baegopang.user.control;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import baegopang.user.bean.AddToCartBean;
import baegopang.user.bean.FoodOrderBean;
import baegopang.user.bean.MemberBean;
import baegopang.user.bean.ReplyBean;
import baegopang.user.bean.StoreBean;
import baegopang.user.dao.MemberDao;
import baegopang.user.dao.MyPageDao;
import baegopang.user.dao.OrderDao;
import baegopang.user.dao.ReplyDao;
import baegopang.user.dao.TotalDao;
import baegopang.user.dao.ZipCodeDao;

@Controller
public class MainController {
	
	@Resource(name = "memberDao")
	private MemberDao memberDao;
	@Resource(name = "zipCodeDao")
	private ZipCodeDao zipCodeDao;
	@Resource(name = "totalDao")
	private TotalDao totalDao;
	@Resource(name="MyPageDao")
	private MyPageDao myDao;
	@Resource(name="orderDao")
	private OrderDao orderDao;
	@Resource(name="replyDao")
	private ReplyDao replyDao;
	
	//로그인
	@RequestMapping(value = "signInPro.do")
	public String signInAction(
			HttpSession session, @RequestParam String userId, String userPw) throws Exception {
		if(userId != null && userPw != null){
			if(memberDao.pwCheck(userId, userPw)){
				session.setAttribute("member", memberDao.selectMember(userId));
				return "redirect:main.do";
			}else{
				return "redirect:index.jsp";
			}
		}else{
			return "redirect:index.jsp";
		}
	}
	
	//메인페이지
	@RequestMapping(value="main.do")
	public String mainAction(){
		return "view/main/main";
	}
	
	//회원가입
	@RequestMapping(value="signUp.do")
	public String signUpAction(MemberBean memberBean){
		memberDao.memberInsert(memberBean);
		return "index";
	}
	
	//회원가입 ID 중복확인
	@RequestMapping(value="idCheck.do")
	public String idCheckAction(@RequestParam(value="id")String id,Model model){
		if(memberDao.idCheck(id)){
			model.addAttribute("checkId", "true");
		}else{
			model.addAttribute("checkId", "false");
		}
		return "view/login/idCheck";
	}
	
	// 회원가입 주소 우편번호 찾기
	@RequestMapping(value="addressPage.do")
	public String addressAction(Model model,@RequestParam(value="dong",required=false)String dong){
		if(dong!=null){
			model.addAttribute("zipCodeList", zipCodeDao.searchAddress(dong));
		}
		return "view/login/addressPage";
	}
	
	// 마이 페이지 버튼 클릭시  
	@RequestMapping(value="myPagePro.do")
	public String myPageProAction(Model model, HttpSession session){
		MemberBean bean = (MemberBean) session.getAttribute("member");
		String id = bean.getId();
		//주문내역
		session.setAttribute("foodOrderList",myDao.selectMemberFoodOrder(id));
		
		//포인트
		session.setAttribute("pangList", myDao.selectMemberPoint(id));
		
		//리뷰관리
		session.setAttribute("replyList", myDao.selectMemberReply(id));
		
		return "redirect:myPage.do";
	}	
	
	// 마이 페이지 이동
	@RequestMapping(value="myPage.do")
	public String myPageAction(Model model,  HttpSession session,@RequestParam(value="state", required=false)String state){
		
		MemberBean bean = (MemberBean) session.getAttribute("member");
		String tel = bean.getTel();
		String[] telArr = tel.split("-");
		session.setAttribute("telArr", telArr);
		
		return "view/main/myPage";
	}	
	
	// 회원정보 수정
	@RequestMapping(value="myPageModPro")
	public String myPageMod(MemberBean memberbean,HttpSession session){
		memberDao.updateMember(memberbean);
		try {
			session.setAttribute("member", memberDao.selectMember(memberbean.getId()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
		}
		return "redirect:main.do";
	}
	
	// 검색
	@RequestMapping(value="searchMain.do")
	public String searchAction(HttpSession session,@RequestParam(value="searchAddress") String searchAddress,@RequestParam(value="searchData") String searchData){
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("address",searchAddress);
		map.put("data",searchData);
		session.setAttribute("searchStoreList",totalDao.selectSearchStore(map));
		return "view/main/searchMain";
	}
	
	//메뉴별 음식점 출력
	@RequestMapping(value="storeByBrandMain.do")
	public String storeByBrandAction(@RequestParam int brandNo,Model model){
		try {
			model.addAttribute("brand", totalDao.selectStoreByBrand(brandNo));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "view/main/storeByBrandMain";
	}
	
	//주문페이지에 음식점정보, 메뉴정보 출력
	@RequestMapping(value="MenuByStore.do")
	public String MenuByStoreAction(@RequestParam int brandNo,String storeName,
			 String id, String reply,HttpSession session){
		try {
			session.setAttribute("brandNo", brandNo);
			session.setAttribute("storeList", totalDao.selectStoreInfo(storeName));
			session.setAttribute("menuList", totalDao.selectMenuByStore(storeName));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<ReplyBean>replyList = replyDao.selectReply(storeName);
		List<ReplyBean>replyCheckList = null;
		
		session.setAttribute("replyList", replyList);
		
		for (ReplyBean replyCheck : replyList) {
			if(replyCheck.getReply() ==1){
				replyCheckList = replyDao.selectReplyCheck(replyCheck.getPnum());			
				session.setAttribute("replyCheckList", replyCheckList);				
			}
		}
		
		return "view/main/MenuByStore";
	}
	
	//리플 작성
	@RequestMapping(value="replyInsert.do")
	public String replyInsertAction(@RequestParam String storeName,
			String id, String reply, String contents, HttpSession session){
		
		ReplyBean replyBean = new ReplyBean();
		
		if(reply != null){
			try{
				replyBean.setNo(replyDao.selectRepSeq());
				replyBean.setStoreName(storeName);
				replyBean.setOrderNumber("orderNumber");
				replyBean.setId(id);
				replyBean.setContents(contents);
				
				if(reply.equals("new")){
					replyBean.setPnum(replyBean.getNo());
					replyBean.setRef(replyBean.getNo());
				} 
				
				System.out.println(replyBean);
			
				replyDao.insertReply(replyBean);					
				}catch (Exception e){
					e.printStackTrace();
				} 
		}
		
		List<ReplyBean>replyList = replyDao.selectReply(storeName);
		List<ReplyBean>replyCheckList = null;
		
		session.setAttribute("replyList", replyList);
		
		for (ReplyBean replyCheck : replyList) {
			if(replyCheck.getReply() ==1){
				replyCheckList = replyDao.selectReplyCheck(replyCheck.getPnum());			
				session.setAttribute("replyCheckList", replyCheckList);				
			}
		}
		
		return "view/main/MenuByStore";
	}
	
	
	//주문페이지 -> 결제페이지 이동
	@RequestMapping(value="payment.do")
	 
	public String paymentAction(Model model,  HttpSession session, 
			@RequestParam String [] menuName, String [] count, String [] price){
		
		MemberBean memberBean = (MemberBean)session.getAttribute("member");
		ArrayList<AddToCartBean>cartList = new ArrayList<>();

		int totalCount = 0;
		int totalPrice = 0;
		
		for(int i=0 ; i < menuName.length ; i++){
			System.out.println(menuName[i]);
		}
		
		int [] cntArr = new int [count.length];
		
		if(count != null){
			for(int i=0; i<count.length; i++){
				cntArr[i] = Integer.parseInt(count[i]);
				totalCount+=cntArr[i];
			}			
		}
		
		int [] priceArr = new int [price.length];
		
		if(price != null){
			for(int i=0; i<price.length; i++){
				priceArr[i] = Integer.parseInt(price[i]);
				totalPrice+=priceArr[i] ;
			}
			
		}
		
		for(int i=0; i < menuName.length ; i++){
			AddToCartBean addToCartBean = new AddToCartBean();
			addToCartBean.setMenuName(menuName[i]);
			addToCartBean.setCnt(cntArr[i]);
			addToCartBean.setPrice(priceArr[i]);
			cartList.add(addToCartBean);
	
		}
		
		session.setAttribute("cartList", cartList);
		session.setAttribute("totalPrice", totalPrice);
		session.setAttribute("totalCount", totalCount);
	
		return "view/payment/payment";
	}
	
	//결제페이지 -> 주문완료 페이지 이동
	@RequestMapping(value="final.do")
	
	public String finalAction(Model model,  HttpSession session, 
			@RequestParam String tel, String address, String comment, String pangPrice){
		
		MemberBean memberBean =  (MemberBean)session.getAttribute("member");
		List<StoreBean>storeList = (List<StoreBean>)session.getAttribute("storeList");
		List<AddToCartBean>menuList = (List<AddToCartBean>)session.getAttribute("cartList") ;
		
		//pang포인트 업데이트 //미완성
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("id", memberBean.getId());
		if(pangPrice!=null){
			int pang=Integer.parseInt(pangPrice);
			//map.put("pang",memberBean.getPang()+100-pang);
		}else{
			//map.put("pang",memberBean.getPang()+100);
		}
		
		FoodOrderBean foodOrderBean = new FoodOrderBean();
		session.setAttribute("comment", comment);
		long time = System.currentTimeMillis(); 

		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMddhhmmss");

		String currentTime = dayTime.format(new Date(time));
		
		if(menuList.size() != 1){
			for(int i = 0; i < menuList.size(); i++){
				foodOrderBean.setOrdernumber(currentTime+memberBean.getId()+"-"+(i+1));
				foodOrderBean.setMemberid(memberBean.getId());
				foodOrderBean.setMembername(memberBean.getName());
				foodOrderBean.setMembertel(tel);
				foodOrderBean.setMemberaddress(address);
				foodOrderBean.setPrice(menuList.get(i).getPrice());
				foodOrderBean.setOrderinfo(comment);
				foodOrderBean.setMenuname(menuList.get(i).getMenuName());
				foodOrderBean.setAmount(menuList.get(i).getCnt());
				foodOrderBean.setStorename(storeList.get(0).getStoreName());
				foodOrderBean.setStoreaddress(storeList.get(0).getLocation());
				foodOrderBean.setStoretel(storeList.get(0).getTel());
				foodOrderBean.setOrdertime(currentTime);
				System.out.println(foodOrderBean);
				//orderDao.orderInsert(foodOrderBean);
			}			
		}else{
				foodOrderBean.setOrdernumber(currentTime+memberBean.getId());
				foodOrderBean.setMemberid(memberBean.getId());
				foodOrderBean.setMembername(memberBean.getName());
				foodOrderBean.setMembertel(tel);
				foodOrderBean.setMemberaddress(address);
				foodOrderBean.setPrice(menuList.get(0).getPrice());
				foodOrderBean.setOrderinfo(comment);
				foodOrderBean.setMenuname(menuList.get(0).getMenuName());
				foodOrderBean.setAmount(menuList.get(0).getCnt());
				foodOrderBean.setStorename(storeList.get(0).getStoreName());
				foodOrderBean.setStoreaddress(storeList.get(0).getLocation());
				foodOrderBean.setStoretel(storeList.get(0).getTel());
				foodOrderBean.setOrdertime(currentTime);
				//orderDao.orderInsert(foodOrderBean);
				System.out.println(foodOrderBean);
		}
				//orderDao.updatePang(map);
			return "view/payment/final";
	}
}
