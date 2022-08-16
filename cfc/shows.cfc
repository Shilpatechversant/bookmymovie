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
            SELECT sh.id,m.movie_poster,m.movie_name,th.theatre_name,
            m.release_date,m.movie_duration,
            sh.total_seats,m.movie_format,
            s.screen_name,st.show_time,st.show_name,
            sh.end_date,sh.priority,sh.show_status
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
            s.screen_name,st.show_time,st.show_name,sh.end_date,sh.show_status,
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

       <cffunction name="deleteShow" access="remote" output="true">
        <cfargument  name="id" type="string">      
        <cfset local.sid=toString(toBinary(arguments.id))>  
        <cftry>      
            <cfquery name="delete_screen"  result="screen_del">
                DELETE FROM bookmymovie.manage_shows
                WHERE id=<cfqueryparam value="#local.sid#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>   
            <cfcatch type = "Database"> 
                    <!--- The message to display. ---> 
                    <h3>You've Thrown a Database <b>Error</b></h3> 
                    <cfoutput> 
                    <!--- The diagnostic message from ColdFusion. ---> 
                    <p>#cfcatch.message#</p> 
                    <p>Caught an exception, type = #CFCATCH.TYPE#</p> 
                    <p>The contents of the tag stack are:</p> 
                    <cfdump var="#cfcatch.tagcontext#"> 
                    </cfoutput> 
                    <cfabort>
            </cfcatch> 
        </cftry>         
      <cfset local.status=hash('12','sha')>
      <cflocation  url="../cfm/admin/list_shows.cfm?status=#local.status#" AddToken="no"> 
  </cffunction> 

  <cffunction name="activeShowDetails" access="public" >   
   <cfset local.Today = #dateFormat(Now(),"yyyy-mm-dd")#>     
        <cfquery name="show_details" result="show_data" >
                SELECT DISTINCT m.movie_name,m.id as mid,sh.id,m.movie_poster,
                                m.movie_language,m.release_date,m.genre,m.movie_format,
                                m.movie_duration,sh.total_seats,            
                                sh.end_date,sh.priority,sh.show_status
                FROM bookmymovie.manage_shows sh
                INNER JOIN bookmymovie.movie_table m ON sh.movie_id =m.id      
                WHERE sh.end_date > <cfqueryparam value="#Today#" cfsqltype="cf_sql_date">
                AND m.release_date < <cfqueryparam value="#local.Today#" cfsqltype="cf_sql_date"> 
                OR sh.end_date=<cfqueryparam value="#local.Today#" cfsqltype="cf_sql_date"> 
                GROUP BY m.movie_name
        </cfquery>
        <cfreturn show_details> 
    </cffunction>

    <cffunction name="allMovieDetails" access="public" >   
        <cfset local.Today = #dateFormat(Now(),"yyyy-mm-dd")#>     
            <cfquery name="show_details" result="show_data" >
                    SELECT DISTINCT m.movie_name,sh.id,m.movie_poster,
                                    m.movie_language,m.release_date,
                                    m.movie_duration,sh.total_seats,            
                                    sh.end_date,sh.priority,sh.show_status
                    FROM bookmymovie.manage_shows sh
                    INNER JOIN bookmymovie.movie_table m ON sh.movie_id =m.id      
                    WHERE m.release_date > <cfqueryparam value="#local.Today#" cfsqltype="cf_sql_date"> 
                    OR  sh.end_date > <cfqueryparam value="#local.Today#" cfsqltype="cf_sql_date">            
                    GROUP BY m.movie_name
            </cfquery>
        <cfreturn show_details> 
    </cffunction> 

    <cffunction name="getShowByDate" access="public" >   
            <cfargument  name="cdate" type="string">         
             <cfset local.cday = #dateFormat(arguments.cdate,"yyyy-mm-dd")#>      
            <cfquery name="show_details" result="show_data">
                SELECT DISTINCT
                    m.movie_name,sh.id,m.movie_poster,
                    m.movie_language,m.release_date,
                    m.movie_duration,sh.total_seats,            
                    sh.end_date,sh.priority,sh.show_status,
                    sh.id,m.movie_poster,m.movie_name,m.genre,
                    m.movie_format,
                    th.theatre_name,m.id as mid,                   
                    s.screen_name,st.show_time,
                    st.show_name,m.id as mid,th.id as t_id,s.id as s_id,st.id as st_id
                FROM bookmymovie.manage_shows sh
                INNER JOIN bookmymovie.movie_table m ON sh.movie_id =m.id
                INNER JOIN bookmymovie.theatre th ON sh.theatre_id=th.id 
                INNER JOIN bookmymovie.screen_table s ON sh.screen_id=s.id
                INNER JOIN bookmymovie.screen_time_table st ON sh.screen_time_id =st.id
                WHERE m.release_date < <cfqueryparam value="#local.cday#" cfsqltype="cf_sql_date"> 
                AND  sh.end_date > <cfqueryparam value="#local.cday#" cfsqltype="cf_sql_date">
                OR sh.end_date = <cfqueryparam value="#local.cday#" cfsqltype="cf_sql_date">   
                OR  m.release_date = <cfqueryparam value="#local.cday#" cfsqltype="cf_sql_date">         
                GROUP BY m.movie_name
            </cfquery>  
        <cfreturn show_details> 
    </cffunction>   

    <cffunction name="getShowDetailsByMovie" access="public" > 
        <cfargument  name="mid" type="integer">   
        <cfargument  name="cdate" type="string">         
            <cfset local.cday = #dateFormat(arguments.cdate,"yyyy-mm-dd")#>      
        <cfquery name="show_details" result="show_data">
            SELECT DISTINCT
                m.movie_name,sh.id,m.movie_poster,
                m.movie_language,m.release_date,
                m.movie_duration,sh.total_seats,            
                sh.end_date,sh.priority,sh.show_status,
                sh.id,sh.theatre_id,m.movie_poster,m.movie_name,
                m.genre,m.release_date,
                th.theatre_name,
                s.screen_name,st.show_time,
                st.show_name,m.id as mid,
                th.id as t_id,s.id as s_id,
                st.id as st_id
            FROM bookmymovie.manage_shows sh
            INNER JOIN bookmymovie.movie_table m ON sh.movie_id =m.id
            INNER JOIN bookmymovie.theatre th ON sh.theatre_id=th.id 
            INNER JOIN bookmymovie.screen_table s ON sh.screen_id=s.id
            INNER JOIN bookmymovie.screen_time_table st ON sh.screen_time_id =st.id
            WHERE sh.movie_id = <cfqueryparam value="#arguments.mid#" cfsqltype="cf_sql_integer"> 
            AND m.release_date < <cfqueryparam value="#local.cday#" cfsqltype="cf_sql_date"> 
            AND  sh.end_date > <cfqueryparam value="#local.cday#" cfsqltype="cf_sql_date">   
            OR  sh.end_date = <cfqueryparam value="#local.cday#" cfsqltype="cf_sql_date">  
        </cfquery>  
    <cfreturn show_details>     
</cffunction> 

<cffunction name="getTimeSlots" access="public">    
    <cfargument  name="theatre_id" type="integer">
    <cfargument  name="mid" type="integer">   
    <cfargument  name="cdate" type="string">         
    <cfset local.cday = #dateFormat(arguments.cdate,"yyyy-mm-dd")#>      
        <cfquery name="time_details" result="time_data">
            SELECT sh.id as sh_id,
                   s.screen_name,
                   st.show_time,
                   st.show_name 
            FROM bookmymovie.manage_shows sh        
            INNER JOIN bookmymovie.screen_table s ON sh.screen_id=s.id
            INNER JOIN bookmymovie.screen_time_table st ON sh.screen_time_id =st.id
            WHERE sh.movie_id = <cfqueryparam value="#arguments.mid#" cfsqltype="cf_sql_integer"> 
            AND sh.theatre_id = <cfqueryparam value="#arguments.theatre_id#" cfsqltype="cf_sql_integer">       
            AND sh.end_date > <cfqueryparam value="#local.cday#" cfsqltype="cf_sql_date">  
            OR  sh.end_date = <cfqueryparam value="#local.cday#" cfsqltype="cf_sql_date">                        
        </cfquery>  
    <cfreturn time_details>
</cffunction>

   <cffunction name="getShowDetailsById" access="public" > 
        <cfargument  name="show_id" type="integer">          
        <cfquery name="show_details" result="show_data" returntype="array">
            SELECT 
                m.movie_name,sh.id as sid,m.movie_poster,m.movie_format,
                m.movie_language,m.release_date,
                m.movie_duration,sh.total_seats,sh.theatre_id,            
                sh.end_date,sh.priority,sh.show_status,
                sh.id,m.movie_poster,m.movie_name,
                m.genre,m.release_date,
                th.theatre_name,
                s.screen_name,s.gold_rate,s.silver_rate,st.show_time,
                st.show_name,m.id as mid,
                th.id as t_id,s.id as s_id,
                st.id as st_id
            FROM bookmymovie.manage_shows sh
            INNER JOIN bookmymovie.movie_table m ON sh.movie_id =m.id
            INNER JOIN bookmymovie.theatre th ON sh.theatre_id=th.id 
            INNER JOIN bookmymovie.screen_table s ON sh.screen_id=s.id
            INNER JOIN bookmymovie.screen_time_table st ON sh.screen_time_id =st.id
            WHERE sh.id = <cfqueryparam value="#arguments.show_id#" cfsqltype="cf_sql_integer">            
        </cfquery>  
    <cfreturn show_details>     
</cffunction> 

 <cffunction name="seatSelect" access="remote">
        <cfargument name="total_seats" type="integer">
        <cfargument name="show_id" type="integer">
        <cfargument name="seats" type="integer">

        <cfargument name="cdate" type="date">
        <cfif arguments.total_seats GT arguments.seats>
            <cfset local.seat_num=toBase64(arguments.seats)>
            <cfset local.show_id=toBase64(arguments.show_id)>
            <cfset local.date=toBase64(arguments.cdate)>
            <cflocation  url="../seat_select.cfm?seat_num=#local.seat_num#&show_id=#local.show_id#&date=#local.date#" addtoken="no">
        <cfelse>
            <cfset local.status=hash('1','sha')>
            <cflocation  url="../cfm/user/list_shows.cfm?status=#local.status#" AddToken="no"> 
        </cfif>
    </cffunction>

</cfcomponent>        

