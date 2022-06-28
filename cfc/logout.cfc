<cfif url.id eq "logout">
    <cfset structClear(Session)>
    <cflocation  url="../index.cfm">
</cfif>