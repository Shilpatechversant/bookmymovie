<cfcomponent name="login">
    <cffunction name="loginAction" access="remote"  output="false">
        <cfargument name="username" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfif arguments.username eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../index.cfm?message=#local.msg#" addtoken ="no">
        </cfif>
        <cfif arguments.password eq "">
            <cfset local.msg=hash('3','sha')>
            <cflocation url="../index.cfm?message=#local.msg#" addtoken ="no">
        </cfif>
        <cfquery datasource="newtech" result="outputdata" name="loginResult">
            SELECT * FROM bookmymovie.user
            WHERE username= <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.username#"> 
            AND password= <cfqueryparam CFSQLType="cf_sql_varchar" value="#hash(arguments.passWord,'SHA')#"> 
            AND role="superadmin" 
        </cfquery>
        <cfif outputdata.RECORDCOUNT GT 0>
            <cfset Session.userId=loginResult.id>
            <cfset Session.username=loginResult.username>
            <cfset Session.loggedin=true />
            <cfif Session.loggedin eq true>
                <cflocation url="../cfm/dashboard.cfm" addtoken ="no">
            </cfif>
        <cfelse>
            <cfset local.msg=hash('4','sha')>
            <cflocation url="../index.cfm?message=#local.msg#">
        </cfif>
    </cffunction>
</cfcomponent>