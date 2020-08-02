package br.com.biblioteca.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import br.com.biblioteca.controller.repository.MembrosRepository;
import br.com.biblioteca.controller.repository.PessoaRepository;
import br.com.biblioteca.controller.repository.ProjetoRepository;
import br.com.biblioteca.model.Membros;
import br.com.biblioteca.model.Pessoa;
import br.com.biblioteca.model.Projeto;

@Controller
public class ProjetoController {

	@Autowired
	PessoaRepository PessoaRepository;
	
	@Autowired
	ProjetoRepository ProjetoRepository;
	
	@Autowired
	MembrosRepository MembrosRepository;
	
	@RequestMapping(value="/paginaInicial", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView("index");
		List<Projeto> listProjeto = ProjetoRepository.findAll();
		modelAndView.addObject("listProjeto",listProjeto);
		return modelAndView;
	}
	
	@RequestMapping(value="/formProjeto", method = RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView modelAndView = new ModelAndView("projeto/form");
		try {
			List<Pessoa> listPessoa = PessoaRepository.findAllByFuncionario(true);
			modelAndView.addObject("listPessoas", listPessoa);
			Projeto projeto = new Projeto();
			modelAndView.addObject("projeto", projeto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}

	@RequestMapping(value = "/doFormProjeto", method = RequestMethod.POST)
	public RedirectView salvar(Projeto projeto, BindingResult result) {
		try {
			ProjetoRepository.save(projeto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new RedirectView("/paginaInicial", true);
	}
	
	@RequestMapping(value="/editProjeto", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam BigDecimal idProjeto) {
		ModelAndView modelAndView = new ModelAndView("projeto/form");
		try {
			Projeto projeto = new Projeto();
			if(!Objects.isNull(idProjeto)) {
				projeto = ProjetoRepository.findById(idProjeto);
				
				if(projeto != null) {
					List<Membros> listMembros = MembrosRepository.findByIdProjeto(projeto.getId());
					modelAndView.addObject("listMembros", listMembros);
				}
			} 
			
			List<Pessoa> listPessoa = PessoaRepository.findAllByFuncionario(true);
			modelAndView.addObject("listPessoas", listPessoa);
			modelAndView.addObject("projeto", projeto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/deleteProjeto", method = RequestMethod.GET)
	public RedirectView delete(@RequestParam BigDecimal idProjeto) {
		Projeto projeto = ProjetoRepository.findById(idProjeto);
		try {
			if(projeto != null) {
				ProjetoRepository.delete(projeto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new RedirectView("/paginaInicial", true);
	}
	
	@RequestMapping(value = "/doFind", method = RequestMethod.POST)
	public ModelAndView doFind(String filter) {
		ModelAndView modelView = new ModelAndView("index");
		List<Projeto> listProjeto= ProjetoRepository.listProjetoNome(filter);
		modelView.addObject("listProjeto",listProjeto);
		return modelView;
	}

}
