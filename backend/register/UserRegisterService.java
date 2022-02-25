package nutrizen.backend.register;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class UserRegisterService {

	public final ArrayList<UserRegister> list = new ArrayList<UserRegister>();
	
	public UserRegisterService() {
		list.add(new UserRegister("Julio", "Duran", "nutrizen@gmail.com", "3333333454", "12345"));
		list.add(new UserRegister("Julio", "Xochimitl", "julio.xochimitl.g@gmail.com", "5618094357", "123"));

		
	}

	public List<UserRegister> getUsers() {
		
		return list;
	}
}
