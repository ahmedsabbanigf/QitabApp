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
  <td>type Document </td>
 <td> ${livreInstance?.type}</td>
  </tr>
   </table>
</g:each>


</body>
</html>