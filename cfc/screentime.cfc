<cfcomponent>
    <cffunction  name="addScreenTime" access="remote">                
        <cfargument  name="show_name" type="string">
        <cfargument  name="screens" type="string">
        <cfargument  name="start_time" type="string">                    
        <cfargument  name="theatre_id" type="string">
     

         <cfset local.theatre_id=toBase64(arguments.theatre_id)>
 
        <cfquery name="theatre_data" result="name_res">
            SELECT theatre_name FROM bookmymovie.theatre WHERE id=<cfqueryparam value="#arguments.theatre_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery> 
        <cfif arguments.show_name eq "">
            <cfset local.msg=hash('12','sha')>
             <cflocation url="../cfm/admin/manage_screen.cfm?theatre_id=#local.theatre_id#&message=#local.msg#" addtoken="no"> 
        </cfif>      
        <cfif arguments.screens eq "">
            <cfset local.msg=hash('12','sha')>
            <cflocation url="../cfm/admin/manage_screen.cfm?theatre_id=#local.theatre_id#&message=#local.msg#" addtoken="no">
        </cfif>
        <cfif arguments.start_time eq "">
            <cfset local.msg=hash('12','sha')>
            <cflocation url="../cfm/admin/manage_screen.cfm?theatre_id=#local.theatre_id#&message=#local.msg#" addtoken="no">
        </cfif>  
         <cfif arguments.theatre_id eq "">
            <cfset local.msg=hash('13','sha')>
            <cflocation url="../cfm/admin/manage_screen.cfm?theatre_id=#local.theatre_id#&message=#local.msg#" addtoken="no">
        </cfif>         
   
        <cfif structKeyExists(form,'stid')>
            <cfif form.stid GT 0>                
                <cfquery datasource="newtech" result="res1">
                    UPDATE bookmymovie.screen_time_table
                    SET 
                    theatre_id=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.theatre_id#">,
                    screen_id=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.screens#">,
                    show_name=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.show_name#">,
                    show_time=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.start_time#">,                        
                    status=<cfqueryparam cfsqltype="cf_sql_varchar" value="active">                         
                    WHERE id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.stid#"> 
                </cfquery>
                    <cfif res1.RecordCount EQ 1>                            
                        <cfset local.theatre_id=toBase64(arguments.theatre_id)>
                        <cfset local.msg=hash('14','sha')>
                        <cflocation url="../cfm/admin/manage_screen.cfm?theatre_id=#local.theatre_id#&message=#local.msg#" addtoken="no">
                    <cfelse>
                        <cfset local.msg=hash('20','sha')>
                        <cflocation url="../cfm/admin/manage_screen.cfm?theatre_id=#local.theatre_id#&message=#local.msg#" addtoken="no">
                    </cfif>                      
            <cfelse>                                     
                        <cfquery datasource="newtech" result="result">
                            INSERT INTO bookmymovie.screen_time_table
                            (
                                theatre_id,
                                screen_id,
                                show_name,
                                show_time,
                                status
                            ) 
                            VALUES 
                            (                                
                                <cfqueryparam value="#arguments.theatre_id#" cfsqltype="cf_sql_varchar">,
                                <cfqueryparam value="#arguments.screens#" cfsqltype="cf_sql_varchar">,
                                <cfqueryparam value="#arguments.show_name#" cfsqltype="cf_sql_varchar">,                                  
                                <cfqueryparam value="#arguments.start_time#" cfsqltype="cf_sql_varchar">,
                                <cfqueryparam value="active" cfsqltype="cf_sql_varchar">
                            )
                        </cfquery>
                        <cfif result.generatedkey>                            
                            <cfset local.theatre_id=toBase64(arguments.theatre_id)>
                            <cfset local.msg=hash('16','sha')>
                            <cflocation url="../cfm/admin/manage_screen.cfm?theatre_id=#local.theatre_id#&message=#local.msg#" addtoken="no">
                        <cfelse>
                                <cfset local.msg=hash('17','sha')>
                            <cflocation url="../cfm/admin/manage_screen.cfm?theatre_id=#local.theatre_id#&message=#local.msg#" addtoken="no">
                        </cfif>    
            </cfif>
            </cfif>
        </cffunction>

    <cffunction name="screenTimeDetails" access="public" output="true">
        <cfquery name="screen_time_details" datasource="newtech">
            SELECT st.id,st.show_name,st.screen_id,st.show_time,s.screen_name,s.theatre_id as tr_id
            FROM bookmymovie.screen_time_table st
            INNER JOIN bookmymovie.screen_table s ON s.id = st.screen_id
        WHERE 
        st.theatre_id= <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#arguments.theatre_id#">
    </cfquery>
    <cfreturn screen_time_details>
    </cffunction> 

    <cffunction  name="getScreenTime" access="remote" returnformat="json" output="false">
        <cfargument name="id" type="numeric" required="true" />
        <cfquery name="getItem" datasource="newtech" returntype="array">
        SELECT * FROM bookmymovie.screen_time_table 
        WHERE id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn getItem />
   </cffunction>  

    <cffunction name="deleteScreenTime" access="remote" output="true">
        <cfargument  name="id" type="string">
        <cfargument  name="tid" type="string">
        <cfset local.sid=toString(toBinary(arguments.id))> 
        <cfset local.tid=toString(toBinary(arguments.tid))> 
        <cftry>      
            <cfquery name="delete_screen_time"  result="screen_del">
                DELETE FROM bookmymovie.screen_time_table
                WHERE id=<cfqueryparam value="#local.sid#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>   
            <cfcatch type = "Database"> 
                    <!--- The message to display. ---> 
                    <h3>You've Thrown a Database <b>Error</b></h3> 
                    <cfoutput> 
                    <!--- The diagnostic message from ColdFusion. ---> 
                    <p>#cfcatch.message#</p> 
                    <p>Caught an exception, type = #CFCATCH.TYPE#</p> 
                    <p>The contents of the tag stack are:</p> 
                    <cfdump var="#cfcatch.tagcontext#"> 
                    </cfoutput> 
                    <cfabort>
            </cfcatch> 
        </cftry>         
        <cfset local.msg=hash('21','sha')> 
        <cflocation url="../cfm/admin/manage_screen.cfm?theatre_id=#arguments.tid#&message=#local.msg#" addtoken="no">  
  </cffunction> 


</cfcomponent>        