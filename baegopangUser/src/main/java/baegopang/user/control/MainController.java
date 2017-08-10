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
	private MemberDao memberDao;
	@Resource(name = "zipCodeDao")
	private ZipCodeDao zipCodeDao;
	@Resource(name = "totalDao")
	private TotalDao totalDao;
	
	//�α���
	@RequestMapping(value = "signInPro.do")
	public String signInAction(
			Model model, @RequestParam String userId, String userPw) throws Exception {
		if(userId != null && userPw != null){
			if(memberDao.idCheck(userId)){
				model.addAttribute("member", memberDao.selectMember(userId));
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
	
	
	//�޴��� ������ ���
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
	
	//�ֹ��������� ����������, �޴����� ���
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
	
	//�ֹ������� -> ���������� �̵�
	@RequestMapping(value="payment.do")
	public String paymentAction(){
		
		//�̿ϼ�
		
		return "view/payment/payment";
	}
	
	
}
