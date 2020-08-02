<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	    <title>Projeto</title>
	    <link rel="stylesheet" type="text/css" href="../static/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css"></link>
		<link rel="stylesheet" type="text/css" href="../static/bootstrap-3.3.5-dist/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href=" ../static/bootstrap-3.3.5-dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href=" ../static/bootstrap-3.3.5-dist/css/bootstrap-theme.css"></link>
	</head>
	<body>
		<div class="container">
			<br/>
			 <h3 class="card-title">Projetos</h3>
			 <br/>
			 <br/>
			 <a href="<s:url value="/formProjeto" />" class="btn btn-default">
				<span class="fa fa-plus"></span>
					Novo Projeto
			 </a>
			 <br/>
			 <br/>
			 <a href="<s:url value="/formPessoa" />" class="btn btn-default">
				<span class="fa fa-plus"></span>
					Adicionar Pessoa
			 </a>
			 <br/>
			 <br/>
			 <s:url value="/doFind" var="acao" />
			 <form id="filter" action="${acao}" method="post">
			 	<input id="cpf" name="filter" type="text" placeholder="Informe o nome do projeto"/>
				 <button type="submit">Buscar</button>
			</form>
			</div> 
			 <br/> <br/> <br/>
			 <c:if test="${not empty listProjeto}">
			 	<table class="table">
				  <thead>
				    <tr>
				      <th scope="col">NOME</th>
				      <th scope="col">DATA INICIO</th>
				   	  <th scope="col">GERENTE RESPONSAVEL</th>
				   	  <th scope="col">PREVISÃO DE TÉRMINO</th>
				   	  <th scope="col">DATA REAL DE TÉRMINO</th>
				   	  <th scope="col">ORÇAMENTO TOTAL</th>
				   	  <th scope="col">DESCRIÇÃO</th>
				   	  <th scope="col">STATUS</th>
				   	  <th scope="col">GRAU RISCO</th>
				      <th></th>
				    </tr>
				  </thead>
				  <tbody>
					  <c:forEach var="item" items="${listProjeto}">
						<tr>
							<td>${item.nome}</td>
							<td><fmt:formatDate value="${item.dataInicio}" pattern="dd/MM/yyyy"/></td>
							<td>${item.pessoa.nome}</td>
							<td><fmt:formatDate value="${item.dataPrevisaoFim}" pattern="dd/MM/yyyy"/></td>
							<td><fmt:formatDate value="${item.dataFim}" pattern="dd/MM/yyyy"/></td>
							<td>${item.orcamento}</td>
							<td>${item.descricao}</td>
							<td>${item.status}</td>
							<td>${item.risco}</td>
							<td>
								<a href="<s:url value="/editProjeto?idProjeto=${item.id}" />" class="btn btn-default">
									<span class="fa fa-edit">Editar</span>
								</a>
								<c:if test="${item.status ne 'INICIADO' && item.status ne 'EM_ANDAMENTO' && item.status ne 'ENCERRADO'}">
									<a href="<s:url value="/deleteProjeto?idProjeto=${item.id}" />" class="btn btn-default">
										<span class="fa fa-edit">Excluir</span>
									</a>
								</c:if>
							</td>
						</tr>
					</c:forEach> 
				  </tbody>
				</table>
			 </c:if>
		
	</body>
	
</html>