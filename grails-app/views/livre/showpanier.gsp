<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="utf-8">
	<title>QitabApp</title>
	
	<link rel="stylesheet" href="${resource(dir: 'cms/css', file: 'bootstrap-united.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'cms/css', file: 'bootstrap-cerulean.css')}" type="text/css">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
	<link rel="stylesheet" href="${resource(dir: 'cms/css', file: 'bootstrap-responsive.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'cms/css', file: 'charisma-app.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'cms/css', file: 'jquery-ui-1.8.21.custom.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'cms/css', file: 'chosen.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'cms/css', file: 'uniform.default.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'cms/css', file: 'colorbox.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'cms/css', file: 'jquery.cleditor.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'cms/css', file: 'jquery.noty.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'cms/css', file: 'noty_theme_default.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'cms/css', file: 'elfinder.min.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'cms/css', file: 'elfinder.theme.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'cms/css', file: 'jquery.iphone.toggle.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'cms/css', file: 'opa-icons.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'cms/css', file: 'uploadify.css')}" type="text/css">
	
	
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	

	
	<link rel="shortcut icon" href="${resource(dir: 'cms/img', file: 'favicon.ico')}">

<script src="/QitabApp/static/cms/js/jquery-1.7.2.min.js"></script>

<style type="text/css">
			    #fade { /*--Masque opaque noir de fond--*/
			  display:none ; /*--masqu? par d?faut--*/
			  background: rgb(0,0,0);
			  position: fixed; left: 0; top: 0;
			  width: 100%; height: 100%;
			  opacity: 0.80;
			  z-index: 9999;
			}
			.popup_block{
			  display: none; /*--masqu? par d?faut--*/
			  background: #fff;
			  padding: 20px;
			  border: 20px solid #ddd;
			  float: left;
			  font-size: 1.2em;
			  position: fixed;
			  top: 50%; left: 50%;
			  z-index: 99999;
			  /*--Les diff?rentes d?finitions de Box Shadow en CSS3--*/
			  -webkit-box-shadow: 0px 0px 20px #000;
			  -moz-box-shadow: 0px 0px 20px #000;
			  box-shadow: 0px 0px 20px #000;
			  /*--Coins arrondis en CSS3--*/
			  -webkit-border-radius: 10px;
			  -moz-border-radius: 10px;
			  border-radius: 10px;
			}
			img.btn_close {
			
			  float: right;
			  margin: -55px -55px 0 0;
			}
			/*--G?rer la position fixed pour IE6--*/
			*html #fade {
			position: absolute;
			}
			*html .popup_block {
			position: absolute;
			}
</style>
<script>
			 $(document).ready(function() {
			$('a.poplight[href^=#]').click(function() {
			var popID = $(this).attr('rel'); //Get Popup Name
			var popURL = $(this).attr('href'); //Get Popup href to define size
			
			//Pull Query & Variables from href URL
			var query= popURL.split('?');
			var dim= query[1].split('&');
			var popWidth = dim[0].split('=')[1]; //Gets the first query string value
			
			//Fade in the Popup and add close button
			$('#' + popID).fadeIn().css({ 'width': Number( popWidth ) }).prepend('<a href="#" class="close"><img src="/percall_admin/cms_xhtml/images/shared/fermer.png" class="btn_close" title="Close Window" alt="Close" /></a>');
			
			//Define margin for center alignment (vertical horizontal) - we add 80px to the height/width to accomodate for the padding and border width defined in the css
			var popMargTop = ($('#' + popID).height() + 80) / 2;
			var popMargLeft = ($('#' + popID).width() + 80) / 2;
			
			//Apply Margin to Popup
			$('#' + popID).css({
			'margin-top' : -popMargTop,
			'margin-left' : -popMargLeft
			});
			
			//Fade in Background
			$('body').append('<div id="fade"></div>'); //Add the fade layer to bottom of the body tag.
			$('#fade').css({'filter' : 'alpha(opacity=80)'}).fadeIn(); //Fade in the fade layer - .css({'filter' : 'alpha(opacity=80)'}) is used to fix the IE Bug on fading transparencies 
			
			return false;
			});
			
			//Close Popups and Fade Layer
			$('a.close, #fade').live('click', function() { //When clicking on the close or fade layer...
			$('#fade , .popup_block').fadeOut(function() {
			$('#fade, a.close').remove(); //fade them both out
			});
			return false;
			});
			});
</script>

</head>

<body>
	
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="#">
				<span style="font-size: 18px;">QitabApp</span>
				</a>
				
				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-shopping-cart"></i><span class="hidden-phone">Mon Panier(${session.nombre})</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="/QitabApp/livre/showpanier">Voir mon panier</a></li>
						<li class="divider"></li>
						<li><a href="/QitabApp/livre/viderpanier" onclick="return confirm('Le panier va se vider entièrement, Vous êtes sûr ??');">Vider mon panier</a></li>
					</ul>
				</div>
	

						
		<form action="/QitabApp/livre/rechercheLivre" id="ModuleAddForm" method="post" accept-charset="utf-8" class="navbar-search pull-left">
		<fieldset>
		<input placeholder="Search" class="search-query span2" name="titre" type="text">
				
		
	 		par titre	 		
	 		<g:radio name="myGroup" value="1"/>
	 		par auteur
			<g:radio name="myGroup" value="2" checked="true"/>
			par type
			<g:radio name="myGroup" value="3" />
		
		</fieldset>
		</form>
						

						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
		<div class="container-fluid">
		<div class="row-fluid">
				
	
			<div class="span2 main-menu-span">
				<div class="well nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li class="nav-header hidden-tablet">Ouvrages</li>
						<li><a class="ajax-link" href="/QitabApp/livre/list"><i class="icon-plus-sign"></i><span class="hidden-tablet"> Ajouter Ouvrage</span></a></li>
						<li><a class="ajax-link" href="/QitabApp/livre/list"><i class="icon-list-alt"></i><span class="hidden-tablet">Liste Ouvrages</span></a></li>
						
						<li class="nav-header hidden-tablet">Panier</li>
						<li><a class="ajax-link" href="/QitabApp/livre/list"><i class="icon-list-alt"></i><span class="hidden-tablet"> Livre</span></a></li>
						<li><a class="ajax-link" href="/QitabApp/livre/list"><i class="icon-list-alt"></i><span class="hidden-tablet">Dictionnaire</span></a></li>
						<li><a class="ajax-link" href="/QitabApp/livre/list"><i class="icon-list-alt"></i><span class="hidden-tablet">Encyclopédie</span></a></li>
						<li><a class="ajax-link" href="/QitabApp/livre/list"><i class="icon-list-alt"></i><span class="hidden-tablet">Tazi Saoud</span></a></li>
						<li><a class="ajax-link" href="/QitabApp/livre/list"><i class="icon-list-alt"></i><span class="hidden-tablet">Revues</span></a></li>
						<li><a class="ajax-link" href="/QitabApp/livre/list"><i class="icon-list-alt"></i><span class="hidden-tablet">2ème étage</span></a></li>

						<li class="nav-header hidden-tablet">Thèses</li>
						<li><a class="ajax-link" href="/QitabApp/livre/list"><i class="icon-plus-sign"></i><span class="hidden-tablet"> Ajouter thèse</span></a></li>
						<li><a class="ajax-link" href="/QitabApp/livre/list"><i class="icon-list-alt"></i><span class="hidden-tablet">Liste thèses</span></a></li>
				<label id="for-is-ajax" class="hidden-tablet" for="is-ajax"><input id="is-ajax" type="checkbox" checked> Pour plus de rapidité</label>		

					</ul>
					
				</div>
			</div>
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<div id="content" class="span10">



    				<%--Contenu du view selectionné--%>
    	<g:set var="entityName" value="${message(code: 'livre.label', default: 'Livre')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
					
	</head>
	<body>

		<!-- Placement du popup -->
	    <div id="identifiant" class="popup_block">
	    <iframe class="frame" style="width:800px; height:500px;" src=""></iframe>
	    </div>
	    
	<g:if test="${livreInstanceList}">
   <%-- show administrative functions --%>
	    
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
			<a rel="identifiant" class="btn btn-success poplight" href="#?w=800" 
			onclick="$('.frame').attr('src','/QitabApp/reservation/validerPanier');">
			<i class="icon-ok icon-white"></i>  
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



		</div><!--/.fluid-container-->

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->	
	<!-- jQuery -->
	<script src="/QitabApp/static/cms/js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="/QitabApp/static/cms/js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	<script src="/QitabApp/static/cms/js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="/QitabApp/static/cms/js/bootstrap-alert.js"></script>
	<!-- modal / dialog library -->
	<script src="/QitabApp/static/cms/js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="/QitabApp/static/cms/js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="/QitabApp/static/cms/js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="/QitabApp/static/cms/js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="/QitabApp/static/cms/js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="/QitabApp/static/cms/js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="/QitabApp/static/cms/js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="/QitabApp/static/cms/js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="/QitabApp/static/cms/js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="/QitabApp/static/cms/js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="/QitabApp/static/cms/js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="/QitabApp/static/cms/js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<!-- data table plugin -->
	<script src='/QitabApp/static/cms/js/jquery.dataTables.min.js'></script>

	<!-- chart libraries start -->
	<script src="/QitabApp/static/cms/js/excanvas.js"></script>
	<script src="/QitabApp/static/cms/js/jquery.flot.min.js"></script>
	<script src="/QitabApp/static/cms/js/jquery.flot.pie.min.js"></script>
	<script src="/QitabApp/static/cms/js/jquery.flot.stack.js"></script>
	<script src="/QitabApp/static/js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="/QitabApp/static/cms/js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="/QitabApp/static/cms/js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="/QitabApp/static/cms/js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="/QitabApp/static/cms/js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="/QitabApp/static/cms/js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="/QitabApp/static/cms/js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="/QitabApp/static/cms/js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="/QitabApp/static/cms/js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="/QitabApp/static/cms/js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="/QitabApp/static/cms/js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="/QitabApp/static/cms/js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="/QitabApp/static/cms/js/charisma.js"></script>
	
</body>
<footer>
		<p class="pull-left">&copy; <a href="#" target="_blank">Projet JEE</a> UPS</p>
		<p class="pull-right">Programmé par : <a href="#">Oussama LAKLALECH & Ahmed SABBANI</a></p><br/>
</footer>
</html>
