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
	 		<g:radio name="myGroup" value="1" checked="true"/>
	 		par auteur
			<g:radio name="myGroup" value="2" />
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
						<li class="nav-header hidden-tablet">Bibliothèque</li>
						<li><a class="ajax-link" href="/QitabApp/livre/list"><i class="icon-list-alt"></i><span class="hidden-tablet">Liste des livres</span></a></li>
						
						<li class="nav-header hidden-tablet">Mon Panier</li>
						<g:if test = "${session.nombre > 0}">
						<g:each in="${session.titres}" var="livreInstance">
						<li><a class="ajax-link"><i class="icon-cart"></i><span class="hidden-tablet">${livreInstance}</span></a></li>
						</g:each>
						</g:if>
						<g:else>
						<li><a class="ajax-link"><i class="icon icon-darkgray icon-cancel"></i><span class="hidden-tablet">Panier vide</span></a></li>
						</g:else>

						<label id="for-is-ajax" class="hidden-tablet" for="is-ajax"><input id="is-ajax" type="checkbox" checked style="display : none;"></label>		

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
    				<g:layoutBody/>



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
		<p class="pull-left"><a href="#" target="_blank">Projet JEE</a> UPS</p>
		<p class="pull-right">Programmé par : <a href="#">Oussama LAKLALECH & Ahmed SABBANI</a></p><br/>
</footer>
</html>