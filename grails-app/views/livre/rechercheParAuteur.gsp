<%@ page import="qitabapp.Livre" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
</head>
<body>
<g:form action="rechercheLivre" >
				
		<fieldset>
	 		
	 		<g:field type="text" name="titre" />
	 		par titre	 		
	 		<g:radio name="myGroup" value="1"/>
	 		par auteur
			<g:radio name="myGroup" value="2" checked="true"/>
			par type
			<g:radio name="myGroup" value="3" />
			<g:submitButton name="rechercheLivre" value="search" />
		</fieldset>
</g:form>

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

<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title="">
						<h2><i class="icon-user"></i> Liste des livres</h2>
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
					
						<g:sortableColumn property="titre" title="${message(code: 'livre.titre.label', default: 'Titre')}" />
					
						<g:sortableColumn property="nombreExemplaires" title="${message(code: 'livre.nombreExemplaires.label', default: 'Nombre Exemplaires')}" />
					
						<g:sortableColumn property="nbrDisponibles" title="${message(code: 'livre.nbrDisponibles.label', default: 'Nbr Disponibles')}" />
					
						<th><g:message code="livre.type.label" default="Type" /></th>
						<th class="sorting">Action</th>
							</tr>
							
						  </thead>   
						  
		   <tbody role="alert" aria-live="polite" aria-relevant="all">
					  	
				<g:each in="${livreInstance}" status="i" var="livreInstance">
					  	
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${livreInstance.id}">${fieldValue(bean: livreInstance, field: "titre")}</g:link></td>
					
						 <g:each in="${livreInstance.auteurs}" status="j" var="acteurInstance">
  							 
 						<td> ${acteurInstance?.nom + " " + acteurInstance?.prenom} </td>
 						</g:each>
					
						<td>${fieldValue(bean: livreInstance, field: "type")}</td>
					
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