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
    
    <cffunction name="webLogout" access="remote" output="false">
      <cfif url.id eq "logout">
        <cfset structClear(Session)>
        <cflocation  url="../cfm/user/welcome.cfm" addtoken="no">
     </cfif>    
    </cffunction>

    <cffunction name="checkUser" access="remote"  output="false">
        <cfargument name="user_email" type="string" required="true">
        <cfargument name="user_password" type="string" required="true">
        <cfargument  name="show_id" type="integer">
        <cfargument  name="movie_id" type="integer">
        <cfargument  name="cdate" type="date">
 
        <cfquery datasource="newtech" result="outputdata" name="loginResult">
            SELECT * FROM bookmymovie.client_table
            WHERE user_email= <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.user_email#"> 
            AND password= <cfqueryparam CFSQLType="cf_sql_varchar" value="#hash(arguments.user_passWord,'SHA')#"> 
        </cfquery>

        <cfif outputdata.RECORDCOUNT GT 0>
            <cfset Session.userId=loginResult.id>
            <cfset Session.username=loginResult.user_email>
            <cfset Session.role=loginResult.role>
            <cfset Session.loggedin=true />
            <cfif Session.loggedin eq true>  
                 <cfset local.msg=hash('5','sha')>   
               <cflocation  url="../cfm/user/movie_ticket_planing.cfm?movie_id=#toBase64(arguments.movie_id)#&tic_date=#toBase64(arguments.cdate)#&message=#local.msg#" addtoken="no">
            </cfif>
        <cfelse>
            <cfset local.msg=hash('4','sha')>
            <cflocation  url="../cfm/user/movie_ticket_planing.cfm?movie_id=#toBase64(arguments.movie_id)#&tic_date=#toBase64(arguments.cdate)#&message=#local.msg#" addtoken="no">
        </cfif>
    </cffunction>

    <cffunction name="checkWebUser" access="remote"  output="false">
        <cfargument name="user_email" type="string" required="true">
        <cfargument name="user_password" type="string" required="true">      
 
        <cfquery datasource="newtech" result="outputdata" name="loginResult">
            SELECT * FROM bookmymovie.client_table
            WHERE user_email= <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.user_email#"> 
            AND password= <cfqueryparam CFSQLType="cf_sql_varchar" value="#hash(arguments.user_passWord,'SHA')#"> 
        </cfquery>

        <cfif outputdata.RECORDCOUNT GT 0>
            <cfset Session.userId=loginResult.id>
            <cfset Session.username=loginResult.user_email>
            <cfset Session.role=loginResult.role>
            <cfset Session.loggedin=true />
            <cfif Session.loggedin eq true>  
                 <cfset local.msg=hash('5','sha')>   
               <cflocation  url="../cfm/user/login.cfm?message=#local.msg#" addtoken="no">
            </cfif>
        <cfelse>
            <cfset local.msg=hash('4','sha')>
            <cflocation  url="../cfm/user/login.cfm?message=#local.msg#" addtoken="no">
        </cfif>
    </cffunction>

     <cffunction name="insertData" access="remote" output="true">
        <cfargument name="user_email" type="string" required="true"/>    
        <cfargument name="user_password" type="string" required="true"/>

        <cfif arguments.user_email eq "" >
            <cfset local.msg=hash('4','sha')>
            <cflocation url="../user/register.cfm?message=#local.msg#" addtoken ="no">
        </cfif>    

        <cfquery name="emailcheck" datasource="newtech">
            select user_email 
            from bookmymovie.client_table
            where user_email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user_email#" >
        </cfquery>
      
        <cfif emailcheck.recordcount >
            <cfset local.msg=hash('8','sha')>
            <cflocation url="../user/register.cfm?message=#local.msg#" addtoken ="no">
        <cfelse>           
            <cfquery datasource="newtech" result="result">
                INSERT INTO bookmymovie.client_table (user_email,password,registered_on,role) VALUES (                     
                    <cfqueryparam value="#arguments.user_email#" cfsqltype="cf_sql_varchar">,                
                    <cfqueryparam value="#hash(arguments.user_passWord,'SHA')#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#datetimeformat(now(),"yyyy-mm-dd HH:n:s")#" cfsqltype="CF_SQL_TIMESTAMP">,'client')
            </cfquery>
            <cfif result.generatedkey>
               <cfset local.msg=hash('1','sha')>
                <cflocation url="../user/login.cfm?message=#local.msg#" addtoken ="no">
            <cfelse>
                <cfset local.msg=hash('2','sha')>
                <cflocation url="../register.cfm?message=#local.msg#" addtoken ="no">
            </cfif>
        </cfif>
    </cffunction>

    <cffunction name="getClientEmailData" access="remote" returnFormat = "json" >
        <cfargument name="email" type="string" required="false" >
        <cfquery name="contacts"  datasource="newtech" result="email_res">
            SELECT * FROM bookmymovie.client_table
            WHERE user_email=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>  
        <cfreturn email_res> 
    </cffunction>

     <cffunction  name="allUsers" access="public">
        <cfquery name="user_list" result="user_res">
            SELECT * from bookmymovie.client_table 
        </cfquery>
        <cfreturn user_list>
    </cffunction>

    <cffunction  name="deleteUser" access="remote">
        <cfargument  name="id" type="integer">
        <cfquery name="user_list" result="user_res">
            DELETE from bookmymovie.client_table  WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfset local.status=hash('1','sha')>
        <cflocation url="../admin/list_users.cfm?status=#local.status#" addtoken="no">
    </cffunction>

</cfcomponent>