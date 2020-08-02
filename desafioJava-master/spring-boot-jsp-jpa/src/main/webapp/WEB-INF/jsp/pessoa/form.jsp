<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	    <title>Formulario Pessoa</title>
	    <link rel="stylesheet" type="text/css" href=" ../static/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css"></link>
		<link rel="stylesheet" type="text/css" href=" ../static/bootstrap-3.3.5-dist/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href=" ../static/bootstrap-3.3.5-dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href=" ../static/bootstrap-3.3.5-dist/css/bootstrap-theme.css"></link>
	</head>
	<body>

		<s:url value="/doFormPessoa" var="acao" />
		<div class="container">
			<br/><br/>
			<h3><strong>Cadastro de Pessoa</strong></h3>
			<br/><br/>
			<sf:form method="post" modelAttribute="pessoa" action="${acao}">
				<c:if test="${not empty pessoa.id}">
					<sf:hidden path="id" />
				</c:if>
			
				<div class="form-group">
					 <label for="nome">Nome:</label>
					<sf:input path="nome" class="form-control"  aria-describedby="emailHelp"/>
				</div>
		
				 <div class="form-group">
					<label for="data">Data Nascimento:</label>
					
					<fmt:formatDate value="${data}" var="dateString" pattern="dd/MM/yyyy" />
					${dateString}
					<sf:input 
						value="${dateString}"
						path="dataNascimento" 
						class="form-control data" 
						aria-describedby="emailHelp"/>
				</div>
				
				<div class="form-group">
					 <label for="nome">CPF:</label>
					<sf:input path="cpf" class="form-control cpf"  aria-describedby="emailHelp"/>
				</div>
				
				<div class="form-group">
					 <label for="idade">É funcionário?</label>
					<br/>
					 Sim <sf:radiobutton path="funcionario" value="1"/>  
        			 Não <sf:radiobutton path="funcionario" value="0"/>  
				</div>
				
				<br/>
				<button type="submit">Salvar</button> 
			</sf:form>	
		</div>
		
		
	</body>
	<script src=" ../static/lib/jquery-1.11.1.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
    <SCRIPT language="javascript">
	    $(document).ready(function () {
	        $('.data').mask('99/99/9999');
	        $('.cpf').mask('999.999.999-99');
	        return false;
	    });
    </SCRIPT>
</html>