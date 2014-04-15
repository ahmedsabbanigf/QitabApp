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
			<g:submitButton name="rechercheLivre" value="search" />
		</fieldset>
</g:form>

<g:each in="${livreList}"
                status="i"
                var="livreInstance">
<table>
  <tr>
  <td>titre</td> 
  <td>${livreInstance?.titre}</td>
  </tr>
  <tr>
  <td>nombre Exemplaire</td> 
 <td> ${livreInstance?.nombreExemplaires}</td>
  </tr>
  <tr>
  <td>nombre disponible </td>
 <td> ${livreInstance?.nbrDisponibles}</td>
  </tr>
   </table>
</g:each>

</body>
</html>