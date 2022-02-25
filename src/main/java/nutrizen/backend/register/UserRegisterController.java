package nutrizen.backend.register;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/userregister/")
public class UserRegisterController {
	private final UserRegisterService userRegister;

	public UserRegisterController(UserRegisterService userRegister) {
		this.userRegister = userRegister;
	}
	
	@GetMapping
	public List<UserRegister> getUsersRegister(){
		return userRegister.getUsers();
		
	}
	
	
}
