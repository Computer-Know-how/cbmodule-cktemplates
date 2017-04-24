CKTemplates
=================

Author
-----------------
Computer Know How/Seth Engen

Summary
-----------------
Adds template support to the CKEditor WYSIWYG window

Description
-----------------
Upgrades the CKEditor WYSIWYG window so you can see your page content during editing the way it will look after you publish.  This is accomplished with two main alterations as follows:

First the module **adds template support** to the CKEditor WYSIWYG editor.  Includes 8 Twitter Bootstrap compatible page templates built in.

Additionally the module **creates a CKEditor custom.css included file** where you can @import your theme stylesheets to further customize the CKEditor WYSIWYG page edit view.

Installation Instructions
-----------------
Drop the 'cktemplates' folder into your modules/contentbox/modules folder within your ContentBox enabled application, or install via the ContentBox Modules ForgeBox link.

After installation the configuration locations are as follows...

**CKEditor Templates** modify your template layout code at "{moduleroot}/includes/templates/templates/default.js" and their associated thumbnails at "{moduleroot}/includes/templates/templates/images/" *(requires a deactivation/reactivation of the module after modification)*.

**CKEditor Styles** add your CSS inclusions to the styles file at "{moduleroot}/includes/custom.css" *(only includes default CKEditor files imported by default...you will need to alter this file to see your CKEditor display your content with your theme)*.

Change Log
-----------------
* Version 1.0 - Initial Release
* Version 1.1 - Updated for ContentBox 3