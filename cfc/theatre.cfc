<cfcomponent name="theatre">
    <cffunction  name="addTheatre" access="remote">                
                    <cfargument  name="theatre_name" type="string">
                    <cfargument  name="theatre_email" type="string">
                    <cfargument  name="phone" type="string">                    
                    <cfargument  name="address" type="string">
                    <cfargument  name="street" type="string">
                    <cfargument  name="pincode" type="string">  

                    <cfif arguments.theatre_name eq "">
                        <cfset local.msg=hash('2','sha')>
                        <cflocation url="../cfm/list_theatre.cfm?message=#local.msg#">
                    </cfif>      
                    <cfif arguments.theatre_email eq "">
                        <cfset local.msg=hash('2','sha')>
                        <cflocation url="../cfm/list_theatre.cfm?message=#local.msg#">
                    </cfif>
                    <cfif arguments.phone eq "">
                        <cfset local.msg=hash('2','sha')>
                        <cflocation url="../cfm/list_theatre.cfm?message=#local.msg#">
                    </cfif>                  
                    <cfif arguments.address eq "">
                        <cfset local.msg=hash('2','sha')>
                        <cflocation url="../cfm/list_theatre.cfm?message=#local.msg#">
                    </cfif>
                    <cfif arguments.street eq "">
                    <cfset local.msg=hash('2','sha')>
                        <cflocation url="../cfm/list_theatre.cfm?message=#local.msg#">
                    </cfif>                       
                    <cfif arguments.pincode eq "">
                        <cfset local.msg=hash('2','sha')>
                        <cflocation url="../cfm/list_theatre.cfm?message=#local.msg#">
                    </cfif> 
            <cfif structKeyExists(form,'id')>
                <cfif form.id GT 0>                     
                        <cfif form.file != "">
                            <cffile action="upload"
                            fileField="file"
                            destination="C:\ColdFusion2021\cfusion\wwwroot\movieticket\assets\userImage"
                            nameconflict="makeunique"
                            result="img">
                            <cfset img = "assets/userImage/#img.clientFile#">
                                <cfelse>
                                <cfset img = "#arguments.old_image#">
                        </cfif>
                        <cfquery datasource="newtech">
                            UPDATE bookmymovie.theatre
                            SET 
                            theatre_name=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.theatre_name#">,
                            fname=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fname#">,
                            lname=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.lname#">,
                            gender=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.gender#">,
                            dob=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.dob#">,
                            image = <cfqueryparam CFSQLType="cf_sql_varchar" value="#img#">,
                            address=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address#">,
                            street=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.street#">,
                            email=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#">,
                            phone=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.phone#">
                            WHERE id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#"> 
                        </cfquery>
                        <cfset local.msg=hash('8','sha')>
                        <cflocation url="../cfm/list_theatre.cfm?message=#local.msg#">       
                <cfelse>             
                 
                    <cfquery name="address_email" datasource="newtech" result="email_res">
                        SELECT * FROM bookmymovie.theatre 
                        WHERE theatre_email=<cfqueryparam value="#arguments.theatre_email#" cfsqltype="CF_SQL_VARCHAR">
                    </cfquery>
                    <cfif email_res.RecordCount GT 0>
                        <cfset local.msg=hash('3','sha')>
                        <cflocation url="../cfm/list_theatre.cfm?message=#local.msg#">
                    </cfif>
                    <cfif form.file != "">
                        <cffile action="upload"
                        fileField="file"
                        destination="C:\ColdFusion2021\cfusion\wwwroot\movieticket\assets\userImage"
                        nameconflict="makeunique"
                        result="img">
                        <cfset img = "assets/userImage/#img.clientFile#">
                        <cfelse>
                        <cfset img = "">
                    </cfif>
                    <cfquery datasource="newtech" result="result">
                            INSERT INTO bookmymovie.theatre (theatre_name,theatre_email,theatre_phone,
                            theatre_image,theatre_address,theatre_street,theatre_pincode,user_id) 
                            VALUES (                                
                                <cfqueryparam value="#arguments.theatre_name#" cfsqltype="cf_sql_varchar">,
                                <cfqueryparam value="#arguments.theatre_email#" cfsqltype="cf_sql_varchar">,
                                <cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar">,                              
                                <cfqueryparam value="#img#" cfsqltype="cf_sql_varchar">,
                                <cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">,
                                <cfqueryparam value="#arguments.street#" cfsqltype="cf_sql_varchar">,
                                <cfqueryparam value="#arguments.pincode#" cfsqltype="cf_sql_varchar">,                          
                                <cfqueryparam value="#Session.userId#" cfsqltype="CF_SQL_INTEGER">)
                    </cfquery>
                    <cfif result.generatedkey>
                        <cfset local.msg=hash('4','sha')>
                        <cflocation url="../cfm/list_theatre.cfm?message=#local.msg#" addtoken="no">
                    <cfelse>
                        <cfset local.msg=hash('5','sha')>
                        <cflocation url="../cfm/list_theatre.cfm?message=#local.msg#">         
                    </cfif>        
                </cfif>
            </cfif>
        </cffunction>

    <cffunction name="getTheatre" access="public" output="true">
            <cfquery name="theatreData" datasource="newtech">
                SELECT * FROM bookmymovie.theatre WHERE user_id= <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#Session.userId#">
            </cfquery>
        <cfreturn theatreData>
    </cffunction>

 </cfcomponent>       