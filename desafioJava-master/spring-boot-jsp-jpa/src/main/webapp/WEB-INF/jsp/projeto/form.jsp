<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	    <title>Formulario Projeto</title>
	    <link rel="stylesheet" type="text/css" href=" ../static/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css"></link>
		<link rel="stylesheet" type="text/css" href=" ../static/bootstrap-3.3.5-dist/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href=" ../static/bootstrap-3.3.5-dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href=" ../static/bootstrap-3.3.5-dist/css/bootstrap-theme.css"></link>
	</head>
	<body>

		<s:url value="/doFormProjeto" var="acao" />
		<div class="container">
			<br/><br/>
			<h3><strong>Cadastro de Projeto</strong></h3>
			<br/><br/>
			<sf:form method="post" modelAttribute="projeto" action="${acao}">
				<c:if test="${not empty projeto.id}">
					<sf:hidden path="id" />
				</c:if>
			
				<div class="form-group">
					 <label for="nome">Nome:</label>
					<sf:input path="nome" class="form-control"  aria-describedby="emailHelp"/>
				</div>
		
				 <div class="form-group">
					<label for="data">Data Início:</label>
					
					<fmt:formatDate value="${data}" var="dateString" pattern="dd/MM/yyyy" />
					${dateString}
					<sf:input 
						value="${dateString}"
						path="dataInicio" 
						class="form-control data" 
						aria-describedby="emailHelp"/>
				</div>
				
				<div class="form-group">
					 <label for="idade">Gerente Responsável:</label>
					<sf:select path="pessoa.id">
						 <sf:options items="${listPessoas}" itemValue="id" itemLabel="nome"/>
		            </sf:select>
				</div>
				
				<div class="form-group">
					<label for="data">Previsão de término:</label>
					
					<fmt:formatDate value="${data}" var="dateString" pattern="dd/MM/yyyy" />
					${dateString}
					<sf:input 
						value="${dateString}"
						path="dataPrevisaoFim" 
						class="form-control data" 
						aria-describedby="emailHelp"/>
				</div>
				
				<div class="form-group">
					<label for="data">Data real de término:</label>
					
					<fmt:formatDate value="${data}" var="dateString" pattern="dd/MM/yyyy" />
					${dateString}
					<sf:input 
						value="${dateString}"
						path="dataFim" 
						class="form-control data" 
						aria-describedby="emailHelp"/>
				</div>
				
				<div class="form-group">
					<label for="data">Orçamento total:</label>
					<sf:input path="orcamento" class="form-control"  aria-describedby="emailHelp"/>
				</div>
				
				<div class="form-group">
					 <label for="nome">Descrição:</label>
					<sf:input path="descricao" class="form-control"  aria-describedby="emailHelp"/>
				</div>
				
				<div class="form-group">
					 <label for="idade">Status:</label>
					<sf:select path="status">
		                <sf:option value="${tipoStatus}" label="Selecione o status"/>
		                <sf:options items="${tipoStatus}" />
		            </sf:select>
				</div>
				
				<div class="form-group">
					 <label for="idade">Grau de Risco:</label>
					<sf:select path="risco">
		                <sf:option value="${tipoRisco}" label="Selecione o risco"/>
		                <sf:options items="${tipoRisco}" />
		            </sf:select>
				</div>
				
				<br/>
				<button type="submit">Salvar</button> 
			</sf:form>		
		</div>
		<c:if test="${not empty projeto.id}">
			<div class="container">
				 <br/><br/>
				 <a href="<s:url value="/formMembro?idProjeto=${projeto.id}" />" class="btn btn-default">
					<span class="fa fa-plus"></span>
						Adicionar Membro ao Projeto
				 </a>
				 <c:if test="${not empty listMembros}">
					<br/><br/>
					<h4>Lista Membros</h4>
					<br/> 
				 	<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">NOME</th>
					      <th scope="col">DATA NASCIMENTO</th>
					      <th scope="col">CPF</th>
					      <th scope="col">É FUNCIONARIO</th>
					    </tr>
					  </thead>
					  <tbody>
						 <c:forEach var="membro" items="${listMembros}">
							<tr>
								<td>${membro.nome}</td>
								<td><fmt:formatDate value="${membro.dataNascimento}" pattern="dd/MM/yyyy"/></td>
								<td>${membro.cpf}</td>
								<td>
									<c:if test="${membro.funcionario eq true}">
										Sim
									</c:if>
									<c:if test="${membro.funcionario ne true}">
										Não
									</c:if>								
								</td>
								
							</tr>
						</c:forEach>
					  </tbody>
					</table>
				 </c:if>
			</div>
		</c:if>
		
	</body>
	<script src=" ../static/lib/jquery-1.11.1.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
    <SCRIPT language="javascript">
	     $(document).ready(function () {
	        $('.data').mask('99/99/9999');
	        return false;
	    });
    </SCRIPT>
</html>