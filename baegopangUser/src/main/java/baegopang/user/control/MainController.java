package baegopang.user.control;

import java.util.ArrayList;
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
import baegopang.user.dao.MemberDao;
import baegopang.user.dao.MyPageDao;
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
	
	//로그인
	@RequestMapping(value = "signInPro.do")
	public String signInAction(
			HttpSession session, @RequestParam String userId, String userPw) throws Exception {
		if(userId != null && userPw != null){
			if(memberDao.pwCheck(userId, userPw)){
				session.setAttribute("member", memberDao.selectMember(userId));
				return "view/main/main";
			}else{
				return "redirect:index.jsp";
			}
		}else{
			return "redirect:index.jsp";
		}
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
		model.addAttribute("foodOrderList",myDao.selectMemberFoodOrder(id));
		
		//포인트
		model.addAttribute("pangList", myDao.selectMemberPoint(id));
		
		//리뷰관리
		model.addAttribute("replyList", myDao.selectMemberReply(id));
		
		return "myPage.do?state=success";
	}	
	
	@RequestMapping(value="myPage.do")
	public String myPageAction(Model model,  HttpSession session,@RequestParam(value="state", required=false)String state){
		
		MemberBean bean = (MemberBean) session.getAttribute("member");

	 	List<FoodOrderBean> list = (List<FoodOrderBean>)session.getAttribute("foodOrderList"); 
	 	List<FoodOrderBean> panglist = (List<FoodOrderBean>)session.getAttribute("pangList");
	 	List<ReplyBean> replylist = (List<ReplyBean>)session.getAttribute("replyList");
		String tel = bean.getTel();
		String[] telArr = tel.split("-");
		
		return "view/main/myPage?state="+state;
		
	}	
	
	//메뉴별 음식점 출력
	@RequestMapping(value="storeByBrandMain.do")
	public String storeByBrandAction(@RequestParam(value="brandno")int brandNo,Model model){
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
	public String MenuByStoreAction(@RequestParam(value="brandno")int brandNo,@RequestParam(value="storeName") String storeName,Model model){
		try {
			model.addAttribute("brandno", brandNo);
			model.addAttribute("storeList", totalDao.selectStoreInfo(storeName));
			model.addAttribute("menuList", totalDao.selectMenuByStore(storeName));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "view/main/MenuByStore";
	}
	
	//주문페이지 -> 결제페이지 이동
	@RequestMapping(value="payment.do")
	 
	public String paymentAction(Model model,  HttpSession session, 
			@RequestParam String [] menuName, String [] count, String [] price ){
		
		MemberBean memberBean = (MemberBean)session.getAttribute("member");
		ArrayList<AddToCartBean>cartList = new ArrayList<>();

		int counting = 0;
		int totalPrice = 0;
		
		for(int i=0 ; i < menuName.length ; i++){
			System.out.println(menuName[i]);
		}
		
		int [] cntArr = new int [count.length];
		
		if(count != null){
			for(int i=0; i<count.length; i++){
				cntArr[i] = Integer.parseInt(count[i]);
				counting+=cntArr[i];
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
	
		return "view/payment/payment";
	}
	
	
}
