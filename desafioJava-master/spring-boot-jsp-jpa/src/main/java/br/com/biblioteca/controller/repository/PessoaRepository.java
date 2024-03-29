package br.com.biblioteca.controller.repository;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.biblioteca.model.Pessoa;
import br.com.biblioteca.model.Projeto;

public interface PessoaRepository  extends JpaRepository<Pessoa, Long>{

	public Pessoa findById(BigDecimal id);
	
	@Query(" FROM Pessoa pessoa"
			+ " WHERE funcionario = :funcionario")
	public List<Pessoa> findAllByFuncionario(@Param("funcionario") Boolean funcionario);
}
