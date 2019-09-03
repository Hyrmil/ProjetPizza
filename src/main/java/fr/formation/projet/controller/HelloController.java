package fr.formation.projet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

	/**
	 * @GetMapping to get rid of the @RequestMapping(path={"/"}, method=RequestMethod.GET) annotation which is noncompliant
	 * but still the same
	 * @param model
	 * @return
	 */
	@GetMapping(path={"/"})
	public String viewForm(Model model) {
		return "accueil";
		
	}
}
