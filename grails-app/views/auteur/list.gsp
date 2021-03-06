
<%@ page import="qitabapp.Livre" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'livre.label', default: 'Livre')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-livre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-livre" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			
			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title="">
						<h2><i class="icon-user"></i> Liste des auteurs</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
					
						<g:sortableColumn property="prenom" title="${message(code: 'auteur.prenom.label', default: 'Prenom')}" />
					
						<g:sortableColumn property="nom" title="${message(code: 'auteur.nom.label', default: 'Nom')}" />
					
						<th class="sorting">Action</th>
							</tr>
							
						  </thead>   
						  
		   <tbody role="alert" aria-live="polite" aria-relevant="all">
					  	
				<g:each in="${auteurInstanceList}" status="i" var="auteurInstance">
					  	
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${auteurInstance.id}">${fieldValue(bean: auteurInstance, field: "prenom")}</g:link></td>
					
						<td>${fieldValue(bean: auteurInstance, field: "nom")}</td>
					
								<td class="center ">
									<a class="btn btn-success" href="">
										<i class="icon-zoom-in icon-white"></i>  
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