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
	
	//�α���
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
	
	//ȸ������
	@RequestMapping(value="signUp.do")
	public String signUpAction(MemberBean memberBean){
		memberDao.memberInsert(memberBean);
		return "index";
	}
	
	//ȸ������ ID �ߺ�Ȯ��
	@RequestMapping(value="idCheck.do")
	public String idCheckAction(@RequestParam(value="id")String id,Model model){
		if(memberDao.idCheck(id)){
			model.addAttribute("checkId", "true");
		}else{
			model.addAttribute("checkId", "false");
		}
		return "view/login/idCheck";
	}
	
	// ȸ������ �ּ� �����ȣ ã��
	@RequestMapping(value="addressPage.do")
	public String addressAction(Model model,@RequestParam(value="dong",required=false)String dong){
		if(dong!=null){
			model.addAttribute("zipCodeList", zipCodeDao.searchAddress(dong));
		}
		return "view/login/addressPage";
	}
	
	// ���� ������ ��ư Ŭ���� 
	@RequestMapping(value="myPagePro.do")
	public String myPageProAction(Model model, HttpSession session){
		
		MemberBean bean = (MemberBean) session.getAttribute("member");
		String id = bean.getId();
		//�ֹ�����
		model.addAttribute("foodOrderList",myDao.selectMemberFoodOrder(id));
		
		//����Ʈ
		model.addAttribute("pangList", myDao.selectMemberPoint(id));
		
		//�������
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
	
	//�޴��� ������ ���
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
	
	//�ֹ��������� ����������, �޴����� ���
	@RequestMapping(value="MenuByStore.do")
	public String MenuByStoreAction(@RequestParam int brandNo,String storeName,
			 String id, HttpSession session){
		try {
			session.setAttribute("brandNo", brandNo);
			session.setAttribute("storeList", totalDao.selectStoreInfo(storeName));
			session.setAttribute("menuList", totalDao.selectMenuByStore(storeName));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ReplyBean replyBean = new ReplyBean();
		
		List<ReplyBean>replyList = replyDao.selectReply(storeName);
		session.setAttribute("replyList", replyList);
		List<ReplyBean>replyCheckList = null;
		
		for(ReplyBean reply : replyList) {
			if(reply.getReply() != 0){
			try{
				replyBean.setNo(replyDao.selectRepSeq());
				replyBean.setStoreName(storeName);
				replyBean.setOrderNumber("orderNumber");
				replyBean.setId(id);
				replyBean.setContents(reply.getContents());
				
				if(reply.equals("new")){
					replyBean.setPnum(replyBean.getNo());
					replyBean.setRef(replyBean.getNo());
				} 
				
				else if(reply != null && reply.equals("reply")){
					replyBean.setRef(reply.getRef());
					replyBean.setPnum(reply.getPnum());
				} 
					
				System.out.println(replyBean);
				replyDao.insertReply(replyBean);
				}catch (Exception e){
					e.printStackTrace();
				} 
			}
		}
		
		return "view/main/MenuByStore";
	}
	
	//�ֹ������� -> ���������� �̵�
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
	
	//���������� -> �ֹ��Ϸ� ������ �̵�
	@RequestMapping(value="final.do")
	
	public String finalAction(Model model,  HttpSession session, 
			@RequestParam String tel, String address, String comment, String pangPrice){
		
		MemberBean memberBean =  (MemberBean)session.getAttribute("member");
		List<StoreBean>storeList = (List<StoreBean>)session.getAttribute("storeList");
		List<AddToCartBean>menuList = (List<AddToCartBean>)session.getAttribute("cartList") ;
		
		//pang����Ʈ ������Ʈ //�̿ϼ�
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
