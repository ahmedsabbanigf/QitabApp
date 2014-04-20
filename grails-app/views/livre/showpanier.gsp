
<%@ page import="qitabapp.Livre" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'livre.label', default: 'Livre')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

	<g:if test="${livreInstanceList}">
   <%-- show administrative functions --%>
<h1>  hehooooooo </h1>
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
					
						<g:sortableColumn property="nombreExemplaires" title="${message(code: 'livre.auteurs.label', default: 'Auteur')}" />
					
						<th><g:message code="livre.type.label" default="Type" /></th>
						<th class="sorting">Action</th>
							</tr>
							
						  </thead>   
						  
		   <tbody role="alert" aria-live="polite" aria-relevant="all">
					  	
				<g:each in="${livreInstanceList}" status="i" var="livreInstance">
					  	
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${livreInstance.id}">${fieldValue(bean: livreInstance, field: "titre")}</g:link></td>
															
						 <td>${livreInstance.auteurs?.nom+" "+livreInstance.auteurs?.prenom}</td> 
					
						<td>${fieldValue(bean: livreInstance, field: "type")}</td>
					
								<td class="center ">
									<a class="btn btn-danger" 
									onclick="return confirm('Voulez-vous vraiment supprimer le livre du panier ??');"
										href="/QitabApp/livre/supprimerLivreDuPanier/${livreInstance.id}">
										<i class="icon-trash icon-white"></i>  
										supprimer                                            
									</a>
								</td>
							</tr>
				</g:each>
			</tbody>
		</table>
		</div>
		<div class="center ">
		<a class="btn btn-success" href="/QitabApp/reservation/validerPanier">
										<i class="icon-zoom-in icon-white"></i>  
										Valider panier                                           
									</a>
									</div>
	</div>
	</div>
	</div>
	</g:if>
<g:else>
<h1>  votre panier est vide  </h1>
</g:else>
</body>
</html>