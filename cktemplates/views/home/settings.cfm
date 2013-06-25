<cfoutput>
<!--============================Sidebar============================-->
<div class="sidebar">
	<!--- Info Box --->
	<div class="small_box expose">
		<div class="header">
			<i class="icon-medkit"></i> Need Assistance?
		</div>
		<div class="body">
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
<!--End sidebar-->
<!--============================Main Column============================-->
<div class="main_column">
	<div class="box">
		<!--- Body Header --->
		<div class="header">
			CK Templates
		</div>
		<!--- Body --->
		<div class="body" id="mainBody">
			#getPlugin("MessageBox").renderit()#

			<div class="alert alert-info">
				<strong>CKEditor Templates</strong> modify your template layouts at <i>"{moduleroot}/includes/templates/templates/default.js"</i> and <i>"{moduleroot}/includes/templates/templates/images/"</i> (requires a deactivation/reactivation of the module after modification).
			</div>

			<div class="alert alert-info">
				<strong>CKEditor Styles</strong> add your CSS inclusions to the styles file at <i>"{moduleroot}/includes/custom.css"</i>.
			</div>
		</div>
	</div>
</div>
</cfoutput>