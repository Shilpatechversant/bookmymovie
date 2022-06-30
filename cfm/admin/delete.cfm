<cfif isDefined("url.id")>
    <cfinvoke component="local.cfc.theatre"  method="deleteTheatre" returnVariable="process" theatreId=#url.id#>
    <cfset local.msg=hash('1','sha')>    
     <cflocation url="../cfm/list_theatre.cfm?status=#local.msg#">  
<cfelse>
    <cfset local.msg=hash('3','sha')>    
     <cflocation url="../cfm/list_theatre.cfm?status=#local.msg#">  
</cfif>

 