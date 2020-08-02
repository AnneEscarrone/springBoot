package br.com.biblioteca.controller;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import br.com.biblioteca.controller.repository.MembrosRepository;
import br.com.biblioteca.controller.repository.ProjetoRepository;
import br.com.biblioteca.model.Membros;
import br.com.biblioteca.model.Projeto;

@Controller
public class MembroController {
	
	@Autowired
	MembrosRepository MembrosRepository;
	
	@Autowired
	ProjetoRepository ProjetoRepository;

	@RequestMapping(value="/formMembro", method = RequestMethod.GET)
	public ModelAndView form(@RequestParam BigDecimal idProjeto) {
		ModelAndView modelAndView = new ModelAndView("membro/form");
		try {
			Membros membro = new Membros();
			modelAndView.addObject("membro", membro);
			modelAndView.addObject("idProjeto", idProjeto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/doFormMembro", method = RequestMethod.POST)
	public RedirectView salvar(Membros membro, BindingResult result) {
		try {
			System.out.println();
			Projeto projeto = ProjetoRepository.findById(membro.getProjeto().getId());
			membro.setProjeto(projeto);
			MembrosRepository.save(membro);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new RedirectView("/editProjeto?idProjeto="+membro.getProjeto().getId(), true);
	}
}
