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
        this.return=true;
    }
      
    function onRequestStart(requestname){      
        if(!structKeyExists(Session, "userId") ){
            if(findNoCase("/movieticket/cfm/dashboard.cfm",requestname) > 0 ||         
            findNoCase("/movieticket/cfm/delete.cfm",requestname) > 0 ||                 
            findNoCase("/movieticket/cfm/list_theatre.cfm",requestname) > 0){
                writeOutput('<center><h1>Login Required</h1>
                <p>Please Login to yout account</p><br>
                  <a href="index.cfm">Click Here</a></center>');
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