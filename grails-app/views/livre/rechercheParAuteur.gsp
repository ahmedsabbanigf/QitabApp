<%@ page import="qitabapp.Livre" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
</head>
<body>

<div>
<g:each in="${livreList}"
                status="i"
                var="livreInstance">
<table>
  <tr>
  <td>titre </td> 
  <td>${livreInstance?.titre}</td>
  </tr>
  <tr>
   <g:each in="${livreInstance.auteurs}" status="j" var="acteurInstance">
  <td>Auteur </td> 
 <td> ${acteurInstance?.nom + " " + acteurInstance?.prenom} </td>
 </g:each>
  </tr>
  <tr>
  <td>type document </td>
 <td> ${livreInstance?.type}</td>
  </tr>
   </table>
</g:each>  

<div class="pagination">
<g:paginate next="Forward" prev="Back"
              max="2"
             total="${livreCount}" />
            </div>
            </div>

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
						<h2><i class="icon-user"></i> Resultat Recherche Par Titre</h2>
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
					  	
				<g:each in="${livreList}" status="i" var="livreInstance">
					  	
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${livreInstance.id}">${fieldValue(bean: livreInstance, field: "titre")}</g:link></td>
						<td>									
						 <g:each in="${livreInstance.auteurs}" status="j" var="acteurInstance">
  
 							 ${acteurInstance?.nom + " " + acteurInstance?.prenom}<br/> 
 						 </g:each>
						</td>
						<td>${fieldValue(bean: livreInstance, field: "type")}</td>
					
								<td class="center ">
									<a class="btn btn-success" href="/QitabApp/livre/ajoutpanier/${livreInstance.id}">
										<i class="icon-zoom-in icon-white"></i>  
										reserver                                           
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