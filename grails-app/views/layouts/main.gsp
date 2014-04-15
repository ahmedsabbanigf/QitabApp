<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="utf-8">
	<title>QitabApp</title>
	
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-united.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-cerulean.css')}" type="text/css">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'charisma-app.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui-1.8.21.custom.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'chosen.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'uniform.default.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'colorbox.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.cleditor.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.noty.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'noty_theme_default.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'elfinder.min.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'elfinder.theme.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.iphone.toggle.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'opa-icons.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'uploadify.css')}" type="text/css">
	
	
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	

	
	<link rel="shortcut icon" href="/biblio/cms/img/favicon.ico">
		
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
						<i class="icon-user"></i><span class="hidden-phone">Mon Panier</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">Voir mon panier</a></li>
						<li class="divider"></li>
						<li><a href="/biblio/Users/logout">Vider mon panier</a></li>
					</ul>
				</div>
	

						
		<form action="/biblio/ouvrages/rechercher" id="ModuleAddForm" method="post" accept-charset="utf-8" class="navbar-search pull-left">
		<input placeholder="Search" class="search-query span2" name="query" type="text">
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
						<li><a class="ajax-link" href="/biblio/Ouvrages/add"><i class="icon-plus-sign"></i><span class="hidden-tablet"> Ajouter Ouvrage</span></a></li>
						<li><a class="ajax-link" href="/biblio/Ouvrages"><i class="icon-list-alt"></i><span class="hidden-tablet">Liste Ouvrages</span></a></li>
						
						<li class="nav-header hidden-tablet">Types</li>
						<li><a class="ajax-link" href="/biblio/Ouvrages/indexType/1"><i class="icon-list-alt"></i><span class="hidden-tablet"> Livre</span></a></li>
						<li><a class="ajax-link" href="/biblio/Ouvrages/indexType/2"><i class="icon-list-alt"></i><span class="hidden-tablet">Dictionnaire</span></a></li>
						<li><a class="ajax-link" href="/biblio/Ouvrages/indexType/3"><i class="icon-list-alt"></i><span class="hidden-tablet">Encyclopédie</span></a></li>
						<li><a class="ajax-link" href="/biblio/Ouvrages/indexType/4"><i class="icon-list-alt"></i><span class="hidden-tablet">Tazi Saoud</span></a></li>
						<li><a class="ajax-link" href="/biblio/Ouvrages/indexType/5"><i class="icon-list-alt"></i><span class="hidden-tablet">Revues</span></a></li>
						<li><a class="ajax-link" href="/biblio/Ouvrages/indexType/6"><i class="icon-list-alt"></i><span class="hidden-tablet">2ème étage</span></a></li>

						<li class="nav-header hidden-tablet">Thèses</li>
						<li><a class="ajax-link" href="/biblio/memories/add"><i class="icon-plus-sign"></i><span class="hidden-tablet"> Ajouter thèse</span></a></li>
						<li><a class="ajax-link" href="/biblio/memories"><i class="icon-list-alt"></i><span class="hidden-tablet">Liste thèses</span></a></li>
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
    				<g:layoutBody/>



		</div><!--/.fluid-container-->

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->	
	<!-- jQuery -->
	<script src="/QitabApp/static/js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="/QitabApp/static/js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	<script src="/QitabApp/static/js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="/biblio/cms/js/bootstrap-alert.js"></script>
	<!-- modal / dialog library -->
	<script src="/QitabApp/static/js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="/QitabApp/static/js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="/QitabApp/static/js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="/QitabApp/static/js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="/QitabApp/static/js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="/QitabApp/static/js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="/QitabApp/static/js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="/QitabApp/static/js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="/QitabApp/static/js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="/QitabApp/static/js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="/QitabApp/static/js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="/QitabApp/static/js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<!-- data table plugin -->
	<script src='/QitabApp/static/js/jquery.dataTables.min.js'></script>

	<!-- chart libraries start -->
	<script src="/QitabApp/static/js/excanvas.js"></script>
	<script src="/QitabApp/static/js/jquery.flot.min.js"></script>
	<script src="/QitabApp/static/js/jquery.flot.pie.min.js"></script>
	<script src="/QitabApp/static/js/jquery.flot.stack.js"></script>
	<script src="/QitabApp/static/js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="/QitabApp/static/js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="/QitabApp/static/js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="/QitabApp/static/js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="/QitabApp/static/js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="/QitabApp/static/js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="/QitabApp/static/js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="/QitabApp/static/js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="/QitabApp/static/js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="/QitabApp/static/js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="/QitabApp/static/js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="/QitabApp/static/js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="/QitabApp/static/js/charisma.js"></script>
	
</body>
<footer>
		<p class="pull-left">&copy; <a href="" target="_blank">Projet JEE</a> UPS</p>
		<p class="pull-right">Programmé par : <a href="#">Oussama LAKLALECH & Ahmed SABBANI</a></p><br/>
</footer>
</html>


<%--<body>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>






<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a></div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
--%>