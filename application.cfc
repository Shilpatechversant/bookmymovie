component {

    this.name = "MovieTicketApp";
    this.datasource = "newtech";
    this.sessionManagement  = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0);
    this.scriptProtect="all";
    this.mappings["/local"] = getDirectoryFromPath(getCurrentTemplatePath());

    function OnApplicationStart(requestname)
    {
        application.obj=createObject('component','cfc.theatre');
        application.obj1=createObject('component','cfc.movie');
        application.show=createObject('component','cfc.shows');
        application.user=createObject('component','cfc.login');
        this.return=true;
    }
      
    function onRequestStart(requestname){ 
             // clear all objects from the cache
            cacheRemoveAll();

        if(findNoCase("/movieticket/welcome.cfm",requestname) > 0){
            location("/movieticket/cfm/user/welcome.cfm",false);
        }  
        if(!structKeyExists(Session, "userId") ){
            if(findNoCase("/movieticket/cfm/admin/dashboard.cfm",requestname) > 0 ||         
            findNoCase("/movieticket/cfm/admin/delete.cfm",requestname) > 0 ||
            findNoCase("/movieticket/cfm/admin/manage_screen.cfm",requestname) > 0 ||                                  
            findNoCase("/movieticket/cfm/admin/list_theatre.cfm",requestname) > 0||
            findNoCase("/movieticket/cfm/admin/list_movies.cfm ",requestname) > 0) 
            {
                writeOutput('<center><h1>Login Required</h1>
                <p>Please Login to yout account</p><br>
                  <a href="../../index.cfm">Click Here</a></center>');
                abort;
            }
        }
    }
    function onSessionEnd(sessionScope, applicationScope){
        writeOutput('<center>
                     <h1>Your session expired. Please login again</h1>
                     <a href="index.cfm">Click Here</a>
                     </center>');
    }
}