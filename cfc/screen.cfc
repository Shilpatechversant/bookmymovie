<cfcomponent>
    <cffunction  name="addScreen" access="remote">                
        <cfargument  name="screen_name" type="string">
        <cfargument  name="gold_rate" type="string">
        <cfargument  name="silver_rate" type="string">                    
        <cfargument  name="theatre_id" type="string">  

        <cfif arguments.screen_name eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/manage_screen.cfm?message=#local.msg#">
        </cfif>      
        <cfif arguments.gold_rate eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/manage_screen.cfm?message=#local.msg#">
        </cfif>
        <cfif arguments.silver_rate eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/manage_screen.cfm?message=#local.msg#">
        </cfif>  
         <cfif arguments.theatre_id eq "">
            <cfset local.msg=hash('3','sha')>
            <cflocation url="../cfm/admin/manage_screen.cfm?message=#local.msg#">
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
                        <cflocation url="../cfm/admin/manage_screen.cfm?message=#local.msg#" addtoken="no">    
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
                            <cfset local.msg=hash('4','sha')>
                            <cflocation url="../cfm/admin/manage_screen.cfm?id=#arguments.theatre_id#" addtoken="no"> 
                        <cfelse>
                            <cfset local.msg=hash('5','sha')>
                            <cflocation url="../cfm/admin/manage_screen.cfm?id=#arguments.theatre_id#" addtoken="no">         
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
</cfcomponent>        