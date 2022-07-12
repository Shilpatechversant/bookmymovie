<cfcomponent>
<cffunction name="addShow" access="remote">
    <cfargument  name="movie" type="integer">
    <cfargument  name="stheatre" type="integer">
    <cfargument  name="th_screen" type="integer">
    <cfargument  name="th_shows" type="integer">
    <cfargument  name="plan_end_date" type="string">
    <cfargument  name="show_priority" type="string">        
    <cfargument  name="total_seats" type="string"> 

        <cfif arguments.movie eq "" || 
            arguments.stheatre eq "" ||
            arguments.th_screen eq "" ||
            arguments.th_shows eq "" ||
            arguments.plan_end_date eq "" ||
            arguments.show_priority eq "" ||
            arguments.total_seats eq ""
            >
        <cfset local.msg=hash('2','sha')>
        <cflocation url="../cfm/admin/list_shows.cfm?message=#local.msg#" addtoken="no">
      </cfif>

<cfif structKeyExists(form,'upid')>
    <cfif form.upid GT 0>                
            <cfquery datasource="newtech">
                UPDATE bookmymovie.manage_shows
                SET 
                movie_id=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.movie#">,
                theatre_id=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.stheatre#">,
                screen_id=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.th_screen#">,
                screen_time_id=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.th_shows#">, 
                end_date=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.plan_end_date#">,    
                priority=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.show_priority#">,  
                total_seats=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.total_seats#">                   
                WHERE id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.upid#"> 
            </cfquery>
             <cfset local.msg=hash('8','sha')>
        <cflocation url="../cfm/admin/list_shows.cfm?message=#local.msg#" addtoken="no">
             <cfelse>     
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
                                <cfset local.status=hash("10","sha")>
                                <cflocation  url="../cfm/admin/list_shows.cfm?status=#local.status#" AddToken="no">
                            </cfif>
                    <cfelse>
                            <cfset local.status=hash('11','sha')>
                            <cflocation  url="../cfm/admin/list_shows.cfm?status=#local.status#" AddToken="no">
                    </cfif>
            </cfif>
            <cflocation  url="../cfm/admin/list_shows.cfm?status=#local.status#" AddToken="no"> 
    </cfif>         
                                
      
    </cffunction>

<cffunction name="showDetails" access="public" >        
        <cfquery name="show_details" result="show_data" >
            SELECT sh.id,m.movie_poster,m.movie_name,th.theatre_name,m.release_date,m.movie_duration,sh.total_seats,
            s.screen_name,st.show_time,st.show_name,sh.end_date,sh.priority
            FROM bookmymovie.manage_shows sh
            INNER JOIN bookmymovie.movie_table m ON sh.movie_id =m.id
            INNER JOIN bookmymovie.theatre th ON sh.theatre_id=th.id 
            INNER JOIN bookmymovie.screen_table s ON sh.screen_id=s.id
            INNER JOIN bookmymovie.screen_time_table st ON sh.screen_time_id =st.id
        </cfquery>  
        <cfreturn show_details> 
    </cffunction>

   <cffunction name="getShowDetails" access="remote" returnFormat = "json" >    
        <cfargument  name="showId" type="integer">    
        <cfquery name="show_details" result="show_data" returntype="array" >
            SELECT sh.id,m.movie_poster,m.movie_name,th.theatre_name,m.release_date,m.movie_duration,sh.total_seats,
            s.screen_name,st.show_time,st.show_name,sh.end_date,
            sh.priority,m.id as m_id,th.id as t_id,s.id as s_id,st.id as st_id
            FROM bookmymovie.manage_shows sh
            INNER JOIN bookmymovie.movie_table m ON sh.movie_id =m.id
            INNER JOIN bookmymovie.theatre th ON sh.theatre_id=th.id 
            INNER JOIN bookmymovie.screen_table s ON sh.screen_id=s.id
            INNER JOIN bookmymovie.screen_time_table st ON sh.screen_time_id =st.id
            WHERE sh.id=<cfqueryparam value="#arguments.showId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>  
        <cfreturn show_details> 
    </cffunction> 
</cfcomponent>        