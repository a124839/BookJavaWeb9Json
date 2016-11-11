package action;



import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;


public class UserAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private User user = new User();
	//��������Ϊuser
	@JSON
	public User getUser(){
		return user;
	}
	//user���Ե�setter����
	public void setUser(User user){
		this.user=user;
	}
	@Override
	public String execute() throws Exception {
		user.setName("a");
		user.setAge(50);
		return SUCCESS;
	}
	
}
