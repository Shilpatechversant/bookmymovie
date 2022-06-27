component {

    this.name = "MovieTicketApp";
    this.datasource = "newtech";
    this.sessionManagement  = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0);
    this.scriptProtect="all";
    function onError(Exception,EventName){
        writeOutput('<center><h1>An error occurred</h1>
        <p>Please Contact the developer</p>
        <p>Error details: #Exception.message#</p></center>');
    } 

    function onMissingTemplate(targetPage){
        writeOutput('<center><h1>This Page is not avilable.</h1>
        <p>Please go back:</p></center>');
    }

    function onSessionEnd(sessionScope, applicationScope){
        writeOutput('<center>
                     <h1>Your session expired. Please login again</h1>
                     <a href="index.cfm">Click Here</a>
                     </center>');
    }
}