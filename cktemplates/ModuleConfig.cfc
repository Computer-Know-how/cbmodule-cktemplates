/**
********************************************************************************
Copyright 2013 Computer Know How, www.compknowhow.com
********************************************************************************

Author: Seth Engen
Description: This module adds template support to the CKEditor window.

********************************************************************************
**/
component {

	// Module Properties
	this.title 				= "CKTemplates";
	this.author 			= "Computer Know How, LLC";
	this.webURL 			= "http://www.compknowhow.com";
	this.description 		= "Adds template support to CKEditor 4 in ContentBox";
	this.version			= "1.1";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "cktemplates";

	function configure(){
		// Compressor Settings
		settings = {
			// Theme to use
			version = "1"
		};

		// SES Routes
		routes = [
			// Module Entry Point
			{pattern="/", handler="home",action="index"},
			// Convention Route
			{pattern="/:handler/:action?"}
		];

		// Interceptors
		interceptors = [

		];

		// Map objects
		binder.map("fileUtils@cktemplates").to("coldbox.system.core.util.FileUtils");
	}

	/**
	* CKEditor Plugin Integrations
	*/
	function cbadmin_ckeditorExtraPlugins(event, interceptData){
		arrayAppend( arguments.interceptData.extraPlugins, "templates" );
	}

	/**
	* CKEditor Toolbar Integrations
	*/
	function cbadmin_ckeditorToolbar(event, interceptData){
		var dimensionNumber = 0;
		for (i=1; i LTE arrayLen(arguments.interceptData.toolbar); i++) {
			if (isStruct(arguments.interceptData.toolbar[i]) AND structFind(arguments.interceptData.toolbar[i],'name') IS 'document') {
				dimensionNumber = i;
			}
		}

		arrayAppend( arguments.interceptData.toolbar[dimensionNumber].items, "-" );
		arrayAppend( arguments.interceptData.toolbar[dimensionNumber].items, "Templates" );
	}

	/**
	* CKEditor Config Integration
	*/
	function cbadmin_ckeditorContentsCss(event, interceptData){
		var contentsCSSPath = event.getModuleRoot('CKTemplates') & "/includes/custom.css?v=1";
		arrayAppend(arguments.interceptData.contentsCss, contentsCSSPath);
	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		// Let's add ourselves to the main menu in the Modules section
		var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");
		// Add Menu Contribution
		menuService.addSubMenu(topMenu=menuService.MODULES,name="CKTemplates",label="CK Templates",href="#menuService.buildModuleLink('CKTemplates','home.settings')#");
		// Override settings?
		var settingService = controller.getWireBox().getInstance("SettingService@cb");
		var args = {name="cbox-cktemplates"};
		var setting = settingService.findWhere(criteria=args);
		if( !isNull(setting) ){
			// Override settings from contentbox custom setting
			controller.getSetting("modules").CKTemplates.settings = deserializeJSON( setting.getvalue() );
		}
	}

	/**
	* Fired when the module is activated
	*/
	function onActivate(){
		var settingService = controller.getWireBox().getInstance("SettingService@cb");
		// Store default settings
		var findArgs = {name="cbox-cktemplates"};
		var setting = settingService.findWhere(criteria=findArgs);
		if( isNull(setting) ){
			var args = {name="cbox-cktemplates", value=serializeJSON( settings )};
			var ckTemplatesSettings = settingService.new(properties=args);
			settingService.save( ckTemplatesSettings );
		}

		// Install the ckeditor plugin
		var ckeditorPluginsPath = controller.getSetting("modules")["contentbox-admin"].path & "/modules/contentbox-ckeditor/includes/ckeditor/plugins/templates";
		var fileUtils = controller.getWireBox().getInstance("fileUtils@cktemplates");
		var pluginPath = controller.getSetting("modules")["CKTemplates"].path & "/includes/templates";
		directoryCopy(pluginPath, ckeditorPluginsPath, true);
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){
		// Let's remove ourselves to the main menu in the Modules section
		var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");
		// Remove Menu Contribution
		menuService.removeSubMenu(topMenu=menuService.MODULES,name="CKTemplates");
	}

	/**
	* Fired when the module is deactivated by ContentBox Only
	*/
	function onDeactivate(){
		var settingService = controller.getWireBox().getInstance("SettingService@cb");
		var args = {name="cbox-cktemplates"};
		var setting = settingService.findWhere(criteria=args);
		if( !isNull(setting) ){
			settingService.delete( setting );
		}
		// Uninstall the ckeditor plugin
		var ckeditorPluginsPath = controller.getSetting("modules")["contentbox-admin"].path & "/modules/contentbox-ckeditor/includes/ckeditor/plugins/templates";
		var fileUtils = controller.getWireBox().getInstance("fileUtils@cktemplates");
		fileUtils.directoryRemove(path=ckeditorPluginsPath, recurse=true);
	}
}