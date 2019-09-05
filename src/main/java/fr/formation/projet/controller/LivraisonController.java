package fr.formation.projet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.formation.projet.entities.Livraison;
import fr.formation.projet.service.LivraisonService;

@Controller
@RequestMapping("/livraison")
public class LivraisonController {

	@Autowired
	private LivraisonService livraisonService;

	@GetMapping("/list")
	public String listcustomer(Model themodel) {
		themodel.addAttribute("customers", livraisonService.getCustomer());

		return "list-customer";
	}

	@GetMapping("/addcustomer")
	public String addCustomer(Model themodel) {
		System.out.println("in addCustomer ");
		Livraison customer = new Livraison();
		themodel.addAttribute(customer);
		return "show-customer-form";
	}

	@PostMapping("/processform")
	public String processForm(Model themodel, @ModelAttribute("customer") Livraison newLivraison) {

		// adding logic here
		livraisonService.addCustomer(newLivraison);

		// display
		themodel.addAttribute("customers", livraisonService.getCustomer());

		System.out.println("in process form");
		return "list-customer";
	}

	@GetMapping("/update")
	public String updateCustomer(Model themodel, @RequestParam("customerId") int theId) {

		themodel.addAttribute("customer", livraisonService.getSingleCustomer(theId));

		return "show-customer-form";

	}

	@GetMapping("/delete")
	public String deleteCustomer(Model themodel, @RequestParam("customerId") int theId) {

		// adding logic here
		livraisonService.deleteCustomer(theId);

		// display
		themodel.addAttribute("customers", livraisonService.getCustomer());

		System.out.println("in process form");
		return "list-customer";

	}

}