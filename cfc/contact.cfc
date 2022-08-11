  <cfcomponent name="contact">
    <cffunction name="contactUs" access="remote">
        <cfargument  name="name" type="string">
        <cfargument  name="email" type="string">
        <cfargument  name="subject" type="string">
        <cfargument  name="message" type="string">
            <cfif arguments.name!="" && arguments.email!="" && arguments.subject!="" && arguments.message!="">
                <cfquery name="contact_us" result="result">
                        INSERT INTO bookmymovie.contact_us_table(
                            name,
                            email_id,
                            subject,
                            message,
                            send_date) 
                        VALUES(
                            <cfqueryparam value="#arguments.name#" cfsqltype="CF_SQL_VARCHAR">,                        
                            <cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="#arguments.subject#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="#arguments.message#" cfsqltype="CF_SQL_VARCHAR"> ,  
                            <cfqueryparam value="#datetimeformat(now(),"yyyy-mm-dd HH:n:s")#"
                             cfsqltype="CF_SQL_TIMESTAMP">                 
                            )
                    </cfquery >
                    <cfif result.RecordCount EQ 1>
                        <cfset local.status=hash('1','sha')>
                    </cfif>>
            <cfelse>
                <cfset local.status=hash('2','sha')>
            </cfif>
            <cflocation  url="../cfm/user/contact_us.cfm?status=#local.status#">
    </cffunction>
    <cffunction  name="getDetails">
        <cfquery name="contact_list" result="user_res">
            SELECT * from bookmymovie.contact_us_table 
        </cfquery>
        <cfreturn contact_list>

    </cffunction>
</cfcomponent>