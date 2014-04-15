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

   ${livreInstance?.titre}
   ${livreInstance?.nombreExemplaires}
   ${livreInstance?.nbrDisponibles}
    <br/>
</g:each>

</body>
</html>