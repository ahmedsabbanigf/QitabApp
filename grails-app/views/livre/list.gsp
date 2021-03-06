
<%@ page import="qitabapp.Livre" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'livre.label', default: 'Livre')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div id="list-livre" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title="">
						<h2><i class="icon-user"></i> Liste des livres</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
					
						<g:sortableColumn property="titre" title="${message(code: 'livre.titre.label', default: 'Titre')}" />
					
						<g:sortableColumn property="nombreExemplaires" title="${message(code: 'livre.Auteurs.label', default: 'Auteur')}" />
					
						<g:sortableColumn property="nbrDisponibles" title="${message(code: 'livre.nbrDisponibles.label', default: 'Nbr Disponibles')}" />
					
						<th><g:message code="livre.type.label" default="Type" /></th>
						<th class="sorting">Action</th>
							</tr>
							
						  </thead>   
						  
		   <tbody role="alert" aria-live="polite" aria-relevant="all">
					  	
				<g:each in="${livreInstanceList}" status="i" var="livreInstance">
					  	
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${livreInstance.id}">${fieldValue(bean: livreInstance, field: "titre")}</g:link></td>
						<td>									
						 <g:each in="${livreInstance.auteurs}" status="j" var="acteurInstance">
  
 							 ${acteurInstance?.nom + " " + acteurInstance?.prenom}<br/> 
 						 </g:each>
						</td>
						<td>${fieldValue(bean: livreInstance, field: "nbrDisponibles")}</td>
						<td>${fieldValue(bean: livreInstance, field: "type")}</td>
					
								<td class="center ">
									<a class="btn btn-success" href="/QitabApp/livre/ajoutpanier/${livreInstance.id}">
										<i class="icon-book icon-white"></i>  
										Résérver                                            
									</a>
								</td>
							</tr>
				</g:each>
			</tbody>
		</table>
		</div>
	</div>
	</div>
	</div>
</body>
</html>