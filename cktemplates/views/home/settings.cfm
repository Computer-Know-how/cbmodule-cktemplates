<cfoutput>
	<!--============================Main Column============================-->
	<div class="row">
		<div class="col-md-12">
			<h1 class="h1">
				<i class="fa fa-file-text-o"></i> CK Templates
			</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-9">
			<div class="panel panel-default">
				<div class="panel-body">
					#getInstance("MessageBox@cbmessagebox").renderit()#

					<div class="alert alert-info">
						<strong>CKEditor Templates</strong> modify your template layouts at <i>"{moduleroot}/includes/templates/templates/default.js"</i> and <i>"{moduleroot}/includes/templates/templates/images/"</i> (requires a deactivation/reactivation of the module after modification).
					</div>

					<div class="alert alert-info">
						<strong>CKEditor Styles</strong> add your CSS inclusions to the styles file at <i>"{moduleroot}/includes/custom.css"</i>.
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-medkit"></i> Need Help?</h3>
				</div>
				<div class="panel-body">
					<a href="http://www.CompKnowHow.com" target="_blank" title="Your ColdBox and ContentBox specialists.">
					<div class="center"><img src="#event.getModuleRoot('CKTemplates')#/includes/images/logo.png" alt="Computer Know How" border="0" /></a><br/></div>

					<p>
						<strong>Computer Know How</strong>
						has a team of talented ColdFusion developers that can be your specialists when it comes to anything ColdBox and ContentBox.
						<a href="mailto:info@compknowhow.com">Contact us</a>, we are here to help!
					</p>
				</div>
			</div>
		</div>
	</div>
</cfoutput>