component{

	// DI
	property name="cb" 				inject="cbHelper@cb";

	function settings(event,rc,prc){
		prc.tabModules_CKTemplates = true;

		// view
		event.setView("home/settings");
	}

}