<cfcomponent>
    <cffunction  name="addScreen" access="remote">                
        <cfargument  name="screen_name" type="string">
        <cfargument  name="gold_rate" type="string">
        <cfargument  name="silver_rate" type="string">                    
        <cfargument  name="theatre_id" type="string">  
        <cfset local.theatre_id=toBase64(arguments.theatre_id)>

        <cfquery name="theatre_data" result="name_res">
            SELECT theatre_name FROM bookmymovie.theatre WHERE id=<cfqueryparam value="#arguments.theatre_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery> 
        <cfif arguments.screen_name eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/manage_screen.cfm?theatre_id=#local.theatre_id#&message=#local.msg#" addtoken="no"> 
        </cfif>      
        <cfif arguments.gold_rate eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/manage_screen.cfm?theatre_id=#local.theatre_id#&message=#local.msg#" addtoken="no"> 
        </cfif>
        <cfif arguments.silver_rate eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/manage_screen.cfm?theatre_id=#local.theatre_id#&message=#local.msg#" addtoken="no"> 
        </cfif>  
         <cfif arguments.theatre_id eq "">
            <cfset local.msg=hash('3','sha')>
            <cflocation url="../cfm/admin/manage_screen.cfm?theatre_id=#local.theatre_id#&message=#local.msg#" addtoken="no"> 
        </cfif>                 
   
            <cfif structKeyExists(form,'id')>
                <cfif form.id GT 0>                
                        <cfquery datasource="newtech">
                            UPDATE bookmymovie.screen_table
                            SET 
                            theatre_id=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.theatre_id#">,
                            screen_name=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.screen_name#">,
                            gold_rate=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.gold_rate#">,
                            silver_rate=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.silver_rate#">,                        
                            status=<cfqueryparam cfsqltype="cf_sql_varchar" value="1">                         
                            WHERE id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#"> 
                        </cfquery>
                        <cfset local.msg=hash('8','sha')>                      
                        <cflocation url="../cfm/admin/manage_screen.cfm?theatre_id=#local.theatre_id#&message=#local.msg#" addtoken="no"> 
               <cfelse>                                     
                        <cfquery datasource="newtech" result="result">
                            INSERT INTO bookmymovie.screen_table(theatre_id,screen_name,gold_rate,silver_rate,status) 
                            VALUES (                                
                                <cfqueryparam value="#arguments.theatre_id#" cfsqltype="cf_sql_varchar">,
                                <cfqueryparam value="#arguments.screen_name#" cfsqltype="cf_sql_varchar">,
                                <cfqueryparam value="#arguments.gold_rate#" cfsqltype="cf_sql_varchar">,                                  
                                <cfqueryparam value="#arguments.silver_rate#" cfsqltype="cf_sql_varchar">,
                                <cfqueryparam value="active" cfsqltype="cf_sql_varchar">)
                        </cfquery>
                        <cfif result.generatedkey>                            
                            <cfset local.theatre_id=toBase64(arguments.theatre_id)>
                            <cfset local.msg=hash('4','sha')>
                            <cflocation url="../cfm/admin/manage_screen.cfm?theatre_id=#local.theatre_id#&message=#local.msg#" addtoken="no"> 
                        <cfelse>
                            <cfset local.msg=hash('5','sha')>
                            <cflocation url="../cfm/admin/manage_screen.cfm?theatre_id=#local.theatre_id#&message=#local.msg#" addtoken="no"> 
                        </cfif>
                </cfif>        
            </cfif>
        </cffunction>

    <cffunction name="screenDetails" access="public" output="true">    
          <cfquery name="screen_details" datasource="newtech">
                SELECT * FROM bookmymovie.screen_table 
                WHERE 
                theatre_id= <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#arguments.theatre_id#">
            </cfquery>
        <cfreturn screen_details>
    </cffunction>  

    <cffunction  name="getScreen" access="remote" returnformat="json" output="false">
        <cfargument name="id" type="numeric" required="true" />
        <cfquery name="getItem" datasource="newtech" returntype="array">
        SELECT * FROM bookmymovie.screen_table 
        WHERE id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn getItem />
   </cffunction> 

   <cffunction name="deleteScreen" access="remote" output="true">
        <cfargument  name="id" type="string">
        <cfargument  name="tid" type="string">
        <cfset local.sid=toString(toBinary(arguments.id))> 
        <cfset local.tid=toString(toBinary(arguments.tid))> 
        <cftry>      
            <cfquery name="delete_screen"  result="screen_del">
                DELETE FROM bookmymovie.screen_table
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
        <cfset local.msg=hash('10','sha')> 
        <cflocation url="../cfm/admin/manage_screen.cfm?theatre_id=#arguments.tid#&message=#local.msg#" addtoken="no">  
  </cffunction> 

</cfcomponent>        