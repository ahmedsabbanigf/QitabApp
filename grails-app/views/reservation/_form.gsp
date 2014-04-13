<%@ page import="qitabapp.Reservation" %>



<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'livres', 'error')} ">
	<label for="livres">
		<g:message code="reservation.livres.label" default="Livres" />
		
	</label>
	
</div>

