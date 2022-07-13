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
             <cfset Session.role=loginResult.role>
            <cfset Session.loggedin=true />
            <cfif Session.loggedin eq true>
                <cflocation url="../cfm/admin/dashboard.cfm" addtoken ="no">
            </cfif>
        <cfelse>
            <cfset local.msg=hash('4','sha')>
            <cflocation url="../index.cfm?message=#local.msg#">
        </cfif>
    </cffunction>

     <cffunction name="updatePassword" access="remote" output="true">
        <cfargument  name="old_pass" type="string">
        <cfargument  name="new_pass" type="string">
        <cfargument  name="c_pass" type="string">
        <cfset local.pass=hash(arguments.new_pass,'SHA')>
        <cfif arguments.old_pass!="" && arguments.new_pass!="" && arguments.c_pass!="">
            <cfif arguments.new_pass==arguments.c_pass> 
                <cfquery name="update_pass" result="pass_res">
                    UPDATE bookmymovie.user SET 
                    password=<cfqueryparam value="#local.pass#" cfsqltype="CF_SQL_VARCHAR">
                    WHERE role="superadmin"
                </cfquery>
                <cfif pass_res.RecordCount NEQ 0>
                    <cfset local.status=hash('1','sha')>
                </cfif>
            <cfelse>
                <cfset local.status=hash('3','sha')>
                <cflocation  url="../cfm/admin/update_password.cfm?status=#local.status#" addtoken="no">
            </cfif>
        <cfelse>
            <cfset local.status=hash('2','sha')>
        </cfif>
        <cflocation  url="../cfm/admin/update_password.cfm?status=#local.status#" addtoken="no">
    </cffunction>

    <cffunction name="logout" access="remote" output="false">
      <cfif url.id eq "logout">
        <cfset structClear(Session)>
        <cflocation  url="../index.cfm" addtoken="no">
     </cfif>    
    </cffunction>
</cfcomponent>