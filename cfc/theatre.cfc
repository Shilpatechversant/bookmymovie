<cfcomponent>
    <cffunction  name="addTheatre" access="remote">                
        <cfargument  name="theatre_name" type="string">
        <cfargument  name="theatre_email" type="string">
        <cfargument  name="phone" type="string">                    
        <cfargument  name="address" type="string">
        <cfargument  name="street" type="string">
        <cfargument  name="pincode" type="string"> 

        <cfif arguments.theatre_name eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/list_theatre.cfm?message=#local.msg#">
        </cfif>      
        <cfif arguments.theatre_email eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/list_theatre.cfm?message=#local.msg#">
        </cfif>
        <cfif arguments.phone eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/list_theatre.cfm?message=#local.msg#">
        </cfif>                  
        <cfif arguments.address eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/list_theatre.cfm?message=#local.msg#">
        </cfif>
        <cfif arguments.street eq "">
        <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/list_theatre.cfm?message=#local.msg#">
        </cfif>                       
        <cfif arguments.pincode eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/list_theatre.cfm?message=#local.msg#">
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
                            theatre_email=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.theatre_email#">,
                            theatre_phone=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.phone#">,                         
                            theatre_image = <cfqueryparam CFSQLType="cf_sql_varchar" value="#img#">,
                            theatre_address=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.address#">,
                            theatre_street=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.street#">,
                            theatre_pincode=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pincode#">                         
                            WHERE id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#"> 
                        </cfquery>
                        <cfset local.msg=hash('8','sha')>
                        <cflocation url="../cfm/admin/list_theatre.cfm?message=#local.msg#">       
               <cfelse>             
                 
                    <cfquery name="address_email" datasource="newtech" result="email_res">
                        SELECT * FROM bookmymovie.theatre 
                        WHERE theatre_email=<cfqueryparam value="#arguments.theatre_email#" cfsqltype="CF_SQL_VARCHAR">
                    </cfquery>
                    <cfif email_res.RecordCount GT 0>
                        <cfset local.msg=hash('3','sha')>
                        <cflocation url="../cfm/admin/list_theatre.cfm?message=#local.msg#">
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
                    <cfif  img.filesize LT 1000000>                    
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
                            <cflocation url="../cfm/admin/list_theatre.cfm?message=#local.msg#" addtoken="no">
                        <cfelse>
                            <cfset local.msg=hash('5','sha')>
                            <cflocation url="../cfm/admin/list_theatre.cfm?message=#local.msg#">         
                        </cfif>                   
                    <cfelse>
                            <cfset local.msg=hash('9','sha')>
                            <cflocation url="../cfm/admin/list_theatre.cfm?message=#local.msg#">         
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

    <cffunction  name="getContact" access="remote" returnformat="json" output="false">
        <cfargument name="id" type="numeric" required="true" />
        <cfquery name="getItem" datasource="newtech" returntype="array">
        SELECT * FROM bookmymovie.theatre 
        WHERE id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn getItem />
   </cffunction>

   <cffunction  name="deleteTheatre" access="public" output="true">
    <cfargument name="theatreId" type="any" required="true" />
    <cfquery datasource="newtech" name="delete_page">
        DELETE 
        FROM bookmymovie.theatre
        WHERE id = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#theatreId#">
    </cfquery>
    <cfreturn>
</cffunction>

<cffunction name="getEmailData" access="remote" returnFormat = "json" >
    <cfargument name="email" type="string" required="false" >
    <cfquery name="contacts"  datasource="newtech" result="email_res">
        SELECT * FROM bookmymovie.theatre
        WHERE theatre_email=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>  
    <cfreturn email_res> 
</cffunction>

<cffunction name="getPhoneData" access="remote" returnFormat = "json" >
    <cfargument name="phone" type="string" required="false" >
    <cfquery name="contacts"  datasource="newtech" result="phone_res">
        SELECT * FROM bookmymovie.theatre
        WHERE theatre_phone=<cfqueryparam value="#arguments.phone#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>  
    <cfreturn phone_res> 
</cffunction>

<cffunction name="getpdfdata" access="public" output="true">
    <cfquery name="theatre_details"  result="res">
        SELECT * FROM bookmymovie.theatre;
    </cfquery>
    <cfreturn theatre_details>
</cffunction>

 </cfcomponent>       