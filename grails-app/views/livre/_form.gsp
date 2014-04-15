<%@ page import="qitabapp.Livre" %>



<div class="fieldcontain ${hasErrors(bean: livreInstance, field: 'titre', 'error')} required">
	<label for="titre">
		<g:message code="livre.titre.label" default="Titre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titre" required="" value="${livreInstance?.titre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: livreInstance, field: 'nombreExemplaires', 'error')} required">
	<label for="nombreExemplaires">
		<g:message code="livre.nombreExemplaires.label" default="Nombre Exemplaires" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreExemplaires" required="" value="${livreInstance?.nombreExemplaires}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: livreInstance, field: 'nbrDisponibles', 'error')} required">
	<label for="nbrDisponibles">
		<g:message code="livre.nbrDisponibles.label" default="Nbr Disponibles" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nbrDisponibles" required="" value="${livreInstance?.nbrDisponibles}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: livreInstance, field: 'auteurs', 'error')} ">
	<label for="auteurs">
		<g:message code="livre.auteurs.label" default="Auteurs" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: livreInstance, field: 'reservations', 'error')} ">
	<label for="reservations">
		<g:message code="livre.reservations.label" default="Reservations" />
		
	</label>
	<g:select name="reservations" from="${qitabapp.Reservation.list()}" multiple="multiple" optionKey="id" size="5" value="${livreInstance?.reservations*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: livreInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="livre.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${qitabapp.TypeDocument.list()}" optionKey="id" required="" value="${livreInstance?.type?.id}" class="many-to-one"/>
</div>

