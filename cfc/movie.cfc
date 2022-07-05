<cfcomponent>
    <cffunction  name="addMovie" access="remote">                
        <cfargument  name="movie_name" type="string">
        <cfargument  name="release_date" type="string">
        <cfargument  name="movie_format" type="string">                    
        <cfargument  name="genre" type="string">
        <cfargument  name="language" type="string">
        <cfargument  name="duration" type="string"> 
        <cfargument  name="trailer_url" type="string"> 
        <cfargument  name="description" type="string">       

        <cfif arguments.movie_name eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/list_movies.cfm?message=#local.msg#" addtoken="no">
        </cfif>      
        <cfif arguments.release_date eq "">
            <cfset local.msg=hash('2','sha')>
             <cflocation url="../cfm/admin/list_movies.cfm?message=#local.msg#" addtoken="no">
        </cfif>
        <cfif arguments.movie_format eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/list_movies.cfm?message=#local.msg#" addtoken="no"> 
        </cfif>                  
        <cfif arguments.genre eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/list_movies.cfm?message=#local.msg#" addtoken="no">
        </cfif>
        <cfif arguments.language eq "">
            <cfset local.msg=hash('2','sha')>
           <cflocation url="../cfm/admin/list_movies.cfm?message=#local.msg#" addtoken="no">
        </cfif>                       
        <cfif arguments.duration eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/list_movies.cfm?message=#local.msg#" addtoken="no">
        </cfif> 
        <cfif arguments.trailer_url eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/list_movies.cfm?message=#local.msg#" addtoken="no">
        </cfif>
        <cfif arguments.description eq "">
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/list_movies.cfm?message=#local.msg#" addtoken="no">
        </cfif>  
            <cfif structKeyExists(form,'id')>
                <cfif form.id GT 0>                     
                    <cfif arguments.poster != "">
                        <cffile action="upload"
                        fileField="poster"
                        destination="C:\ColdFusion2021\cfusion\wwwroot\movieticket\assets\poster"
                        nameconflict="makeunique"
                        result="poster_img">
                        <cfset poster_img = "assets/poster/#poster_img.clientFile#">
                    <cfelse>
                        <cfset poster_img = "#arguments.old_image#">
                    </cfif>

                    <cfif arguments.wallpaper != "">
                        <cffile action="upload"
                        fileField="wallpaper"
                        destination="C:\ColdFusion2021\cfusion\wwwroot\movieticket\assets\wallpaper"
                        nameconflict="makeunique"
                        result="wallpaper_img">
                        <cfset wallpaper_img = "assets/poster/#wallpaper_img.clientFile#">
                    <cfelse>
                        <cfset wallpaper_img = "#arguments.old1_image#">
                    </cfif>
                        <cfquery datasource="newtech">
                            UPDATE bookmymovie.movie_table
                            SET 
                            movie_name=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.movie_name#">,
                            release_date=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.release_date#">,
                            movie_format=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.movie_format#">,                         
                            movie_language = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.language#">,
                            movie_duration=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.duration#">,
                            movie_trailer=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.trailer_url#">,
                            movie_poster=<cfqueryparam cfsqltype="cf_sql_varchar" value="#poster_img#">, 
                            movie_wallpaper=<cfqueryparam cfsqltype="cf_sql_varchar" value="#wallpaper_img#">, 
                            movie_des=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.description#">,  
                            status=<cfqueryparam cfsqltype="cf_sql_varchar" value="1">,    
                            genre=<cfqueryparam cfsqltype="cf_sql_varchar" value="1">                   
                            WHERE id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#"> 
                        </cfquery>
                        <cfset local.msg=hash('8','sha')>
                        <cflocation url="../cfm/admin/list_movies.cfm?message=#local.msg#" addtoken="no">       
               <cfelse> 
           
                    <cfif arguments.poster != "">
                        <cffile action="upload"
                        fileField="poster"
                        destination="C:\ColdFusion2021\cfusion\wwwroot\movieticket\assets\poster"
                        nameconflict="makeunique"
                        result="poster_img">
                        <cfset poster_img = "assets/poster/#poster_img.clientFile#">
                        <cfelse>
                        <cfset poster_img = "">
                    </cfif>
                    <cfif arguments.wallpaper != "">
                        <cffile action="upload"
                        fileField="wallpaper"
                        destination="C:\ColdFusion2021\cfusion\wwwroot\movieticket\assets\wallpaper"
                        nameconflict="makeunique"
                        result="wallpaper_img">
                        <cfset wallpaper_img = "assets/poster/#wallpaper_img.clientFile#">
                        <cfelse>
                        <cfset wallpaper_img = "">
                    </cfif>
                    <cfif  poster_img.filesize LT 1000000 && wallpaper_img.filesize LT 1000000>                    
                        <cfquery datasource="newtech" result="result">
                            INSERT INTO bookmymovie.movie_table(
                                movie_name,
                                release_date,
                                movie_format,
                                movie_language,
                                movie_duration,
                                movie_trailer,
                                movie_poster,
                                movie_wallpaper,
                                movie_des,
                                status,
                                genre
                                ) 
                                VALUES 
                                (                                
                                    <cfqueryparam value="#arguments.movie_name#" cfsqltype="cf_sql_varchar">,
                                    <cfqueryparam value="#arguments.relase_date#" cfsqltype="cf_sql_varchar">,
                                    <cfqueryparam value="#arguments.movie_format#" cfsqltype="cf_sql_varchar">,
                                    <cfqueryparam value="#arguments.language#" cfsqltype="cf_sql_varchar">,
                                    <cfqueryparam value="#arguments.duration#" cfsqltype="cf_sql_varchar">,
                                    <cfqueryparam value="#arguments.trailer_url#" cfsqltype="cf_sql_varchar">,
                                    <cfqueryparam value="#poster_img#" cfsqltype="cf_sql_varchar">,
                                    <cfqueryparam value="#wallpaper_img#" cfsqltype="cf_sql_varchar">,
                                    <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_varchar">, 
                                    <cfqueryparam value="1" cfsqltype="cf_sql_varchar">,
                                    <cfqueryparam value="#arguments.genre#" cfsqltype="cf_sql_varchar">
                                 )
                        </cfquery>
                        <cfif result.generatedkey>
                            <cfset local.msg=hash('4','sha')>
                           <cflocation url="../cfm/admin/list_movies.cfm?message=#local.msg#" addtoken="no">
                        <cfelse>
                            <cfset local.msg=hash('5','sha')>
                            <cflocation url="../cfm/admin/list_movies.cfm?message=#local.msg#" addtoken="no">  
                        </cfif>                   
                    <cfelse>
                            <cfset local.msg=hash('9','sha')>
                            <cflocation url="../cfm/admin/list_movies.cfm?message=#local.msg#" addtoken="no">        
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

<cffunction name="deleteTheatre" access="remote" output="true">
    <cfargument  name="id" type="string">  
    <cftry>      
        <cfquery name="delete_theatre"  result="theatre_del">
            DELETE FROM bookmymovie.theatre 
            WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
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
    <cfset local.msg=hash('1','sha')>    
    <cflocation url="../cfm/admin/list_theatre.cfm?status=#local.msg#"> 
</cffunction>

   <cffunction name="getTheatreDetail" access="public" output="true">
        <cfargument name="id" type="integer" required="false" >
        <cfquery name="theatres" result="theatre_data" >
            SELECT * FROM bookmymovie.theatre
            WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>  
        <cfreturn theatres> 
    </cffunction>

 </cfcomponent>       