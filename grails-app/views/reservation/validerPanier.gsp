<%@ page import="qitabapp.Livre" %>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		h1	{
		color: #4b4b4b;
		font-family: Tahoma;
		font-size: 22px;
		line-height: 24px;
		font-weight: normal;
		}
		label {
		padding: 2px;
		line-height: 20px;
		color:#666;
        font-weight: bold;
        font-family: verdana, Arial, Helvetica, sans-serif;
        padding-left: 4px;
        vertical-align: top;
        width: 10em;
		}
		h3	{
		color: #393939;
		font-size: 14px;
		font-weight: bold;
		line-height: 18px;
		margin-bottom: 10px;
		}
	</style>
</head>
<body>
 <g:if test = "${reservation.code}">
 
<h1>Infos Reservation</h1>
 <label> Code : </label><h3 style="color:red;">${reservation.code}</h3>
 <label> Date limite de retrait : </label><h3 style="color:red;">${reservation.dateReservation}</h3>
 <label> Rappel de votre reservation : </label>
 <g:each in="${reservation.livres}" var="livreInstance">
 <p>${livreInstance}</p>
 </g:each>
 
 </g:if>
 <g:else>
 		<h1>Vous avez déjà validé votre panier</h1>
 </g:else>
</body>
</html>