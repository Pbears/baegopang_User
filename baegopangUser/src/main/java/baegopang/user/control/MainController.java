package baegopang.user.control;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import baegopang.user.dao.MemberDao;

@Controller
public class MainController {
	
	@Resource(name = "memberDao")
	private MemberDao MemberDao;
	
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
}
