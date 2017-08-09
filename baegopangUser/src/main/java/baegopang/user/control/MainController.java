package baegopang.user.control;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import baegopang.user.bean.MemberBean;
import baegopang.user.dao.MemberDao;
import baegopang.user.dao.TotalDao;
import baegopang.user.dao.ZipCodeDao;

@Controller
public class MainController {
	
	@Resource(name = "memberDao")
	private MemberDao MemberDao;
	@Resource(name = "zipCodeDao")
	private ZipCodeDao zipCodeDao;
	@Resource(name = "totalDao")
	private TotalDao totalDao;
	
	//로그인
	@RequestMapping(value = "signInPro.do")
	public String signInAction() {
	/*		Model model,
			@RequestBody String userId, String userPw) {
		
		MemberDao memberDao = new MemberDao();
		
		if (userId != null && userPw == null) {
			if (memberDao.idCheck(userId)) {
				return "view/index.jsp?userId=" + userId;
			} else {
				return "view/index.jsp?fail=id";
			}
		}else if(userId!=null&userPw!=null){
			if(memberDao.pwCheck(userId ,userPw)){
				try {
					model.addAttribute("member", memberDao.selectMember(userId));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return "redirect:view/main/main.jsp";
			}else{
				return "redirect:view/index.jsp?userId="+userId+"&fail=pw";
			}
		}*/
		return "redirect:view/main/main.jsp";
	}
	
	//회원가입
	@RequestMapping(value="signUp.do")
	public String signUpAction(MemberBean memberBean){
		MemberDao.memberInsert(memberBean);
		return "index";
	}
	
	//회원가입 ID 중복확인
	@RequestMapping(value="idCheck.do")
	public String idCheckAction(@RequestParam(value="id")String id,Model model){
		if(MemberDao.idCheck(id)){
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
	public String paymentAction(){
		
		//미완성
		
		return "view/payment/payment";
	}
	
	
}
