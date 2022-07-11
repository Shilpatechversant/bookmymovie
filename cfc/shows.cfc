<cfcomponent>
<cffunction name="addShow" access="remote">
    <cfargument  name="movie" type="integer">
    <cfargument  name="stheatre" type="integer">
    <cfargument  name="th_screen" type="integer">
    <cfargument  name="th_shows" type="integer">
    <cfargument  name="plan_end_date" type="string">
    <cfargument  name="show_priority" type="string">        
    <cfargument  name="total_seats" type="string">        
    <cfif arguments.movie !="" && arguments.stheatre !="" && arguments.th_screen!="" && arguments.th_shows!=""
        && arguments.plan_end_date !="" && arguments.show_priority!="" && arguments.total_seats!="">
        <cfquery name="add_show" result="show_res">
            INSERT INTO bookmymovie.manage_shows(                        
                movie_id,
                theatre_id,
                screen_id,
                screen_time_id,
                end_date,                        
                priority,                      
                total_seats
                ) 
            VALUES(                            
                    <cfqueryparam value="#arguments.movie#" cfsqltype="CF_SQL_INTEGER">,
                    <cfqueryparam value="#arguments.stheatre#" cfsqltype="CF_SQL_INTEGER">,
                    <cfqueryparam value="#arguments.th_screen#" cfsqltype="CF_SQL_INTEGER">,
                    <cfqueryparam value="#arguments.th_shows#" cfsqltype="CF_SQL_INTEGER">,
                    <cfqueryparam value="#arguments.plan_end_date#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.show_priority#" cfsqltype="CF_SQL_VARCHAR">,                            
                    <cfqueryparam value="#arguments.total_seats#" cfsqltype="CF_SQL_VARCHAR">               
                                                                            
                    )
        </cfquery>
        <cfif show_res.RecordCount EQ 1>
            <cfset local.status=hash("1","sha")>
        </cfif>
    <cfelse>
            <cfset local.status=hash('4','sha')>
    </cfif>
    <cflocation  url="../cfm/admin/list_shows.cfm?status=#local.status#" AddToken="no">    
</cffunction>

</cfcomponent>        