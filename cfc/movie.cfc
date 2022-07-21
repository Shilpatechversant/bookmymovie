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
        <cfargument  name="poster" type="string">
        <cfargument  name="wallpaper" type="string">

          <cfif arguments.movie_name eq "" || 
                arguments.release_date eq "" ||
                arguments.movie_format eq "" ||
                arguments.genre eq "" ||
                arguments.language eq "" ||
                arguments.duration eq "" ||
                arguments.trailer_url eq "" ||
                arguments.description eq "" 
                >
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/list_movies.cfm?message=#local.msg#" addtoken="no">
        </cfif>         
        <cfif structKeyExists(form,'id')>                
            <cfif form.id GT 0>                     
                    <cfif arguments.poster != "">
                        <cfif len(trim(arguments.poster) ) >      
                            <cffile action="upload" 
                                fileField="form.poster"  
                                destination="C:\ColdFusion2021\cfusion\wwwroot\movieticket\assets\poster" 
                                result="fileUpload" 
                                nameconflict="overwrite">
                                <cfif fileupload.filesize lt 1000000>            
                                    <cfset local.poster=fileupload.serverfile >
                                <cfelse>
                                    <cfset local.status=hash('6','sha')> 
                                    <cflocation url="../cfm/admin/list_movies.cfm?status=#local.status#" addtoken="no"> 
                                </cfif>
                        </cfif>
                    <cfelse>
                       <cfset local.poster = "#arguments.old_image#">
                    </cfif>

                    <cfif arguments.wallpaper != "">
                        <cfif len(trim(arguments.wallpaper))>
                                <cffile action="upload" 
                                        fileField="form.wallpaper"  
                                        destination="C:\ColdFusion2021\cfusion\wwwroot\movieticket\assets\wallpaper" 
                                        result="wallUpload" 
                                        nameconflict="overwrite">

                                <cfif wallUpload.filesize lt 1000000>            
                                    <cfset local.wallpaper=wallUpload.serverfile >
                                <cfelse>
                                    <cfset local.status=hash('6','sha')>
                                    <cflocation url="../cfm/admin/list_movies.cfm?status=#local.status#" addtoken="no">  
                                </cfif>                  
                        </cfif>
                    <cfelse>
                        <cfset local.wallpaper = "#arguments.old_image1#">
                    </cfif>
                        <cfquery datasource="newtech">
                            UPDATE bookmymovie.movie_table
                            SET 
                            movie_name=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.movie_name#">,
                            release_date=<cfqueryparam cfsqltype="cf_sql_date" value="#arguments.release_date#">,
                            movie_format=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.movie_format#">,                         
                            movie_language = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.language#">,
                            movie_duration=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.duration#">,
                            movie_trailer=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.trailer_url#">,
                            movie_poster=<cfqueryparam cfsqltype="cf_sql_varchar" value="#local.poster#">, 
                            movie_wallpaper=<cfqueryparam cfsqltype="cf_sql_varchar" value="#local.wallpaper#">, 
                            movie_des=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.description#">,  
                            status=<cfqueryparam cfsqltype="cf_sql_varchar" value="1">,    
                            genre=<cfqueryparam cfsqltype="cf_sql_varchar" value="1">                   
                            WHERE id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#"> 
                        </cfquery>
                        <cfset local.msg=hash('8','sha')>
                        <cflocation url="../cfm/admin/list_movies.cfm?message=#local.msg#" addtoken="no">       
            <cfelse> 

                <cfquery name="movie_exists" result="movie_res">
                    SELECT movie_name 
                    FROM bookmymovie.movie_table 
                    WHERE movie_name=<cfqueryparam value="#arguments.movie_name#" cfsqltype="CF_SQL_VARCHAR">
                </cfquery>
                <cfquery name="trailer_exists" result="trailer_res">
                        SELECT movie_trailer 
                        FROM bookmymovie.movie_table 
                        WHERE movie_trailer=<cfqueryparam value="#arguments.trailer_url#" cfsqltype="CF_SQL_VARCHAR">
                </cfquery>

                <cfif movie_res.RecordCount NEQ 0>
                    <cfset local.status=hash('10','sha')>
                    <cflocation url="../cfm/admin/list_movies.cfm?status=#local.status#" addtoken="no">
                </cfif> 

                <cfif trailer_res.RecordCount NEQ 0>
                    <cfset local.status=hash('11','sha')>
                    <cflocation url="../cfm/admin/list_movies.cfm?status=#local.status#" addtoken="no">
                </cfif>
           
                <cfif len(trim(arguments.poster) ) >      
                    <cffile action="upload" 
                            fileField="form.poster"  
                            destination="C:\ColdFusion2021\cfusion\wwwroot\movieticket\assets\poster" 
                            result="fileUpload" 
                            nameconflict="overwrite">
                    <cfif fileupload.filesize lt 1000000>            
                        <cfset local.poster=fileupload.serverfile >
                    <cfelse>
                        <cfset local.status=hash('6','sha')>  
                        <cflocation url="../cfm/admin/list_movies.cfm?status=#local.status#" addtoken="no">  
                    </cfif>
                </cfif>

                <cfif len(trim(arguments.wallpaper))>
                    <cffile action="upload" 
                            fileField="form.wallpaper"  
                            destination="C:\ColdFusion2021\cfusion\wwwroot\movieticket\assets\wallpaper" 
                            result="wallUpload" 
                            nameconflict="overwrite">

                    <cfif wallUpload.filesize lt 1000000>            
                        <cfset local.wallpaper=wallUpload.serverfile >
                    <cfelse>
                        <cfset local.status=hash('6','sha')>  
                    </cfif>                  
                </cfif>
                                     
                    <cfquery datasource="newtech" result="result">
                        INSERT INTO bookmymovie.movie_table
                        (
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
                                <cfqueryparam value="#arguments.release_date#" cfsqltype="cf_sql_date">,
                                <cfqueryparam value="#arguments.movie_format#" cfsqltype="cf_sql_varchar">,
                                <cfqueryparam value="#arguments.language#" cfsqltype="cf_sql_varchar">,
                                <cfqueryparam value="#arguments.duration#" cfsqltype="cf_sql_varchar">,
                                <cfqueryparam value="#arguments.trailer_url#" cfsqltype="cf_sql_varchar">,
                                <cfqueryparam value="#local.poster#" cfsqltype="cf_sql_varchar">,
                                <cfqueryparam value="#local.wallpaper#" cfsqltype="cf_sql_varchar">,
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
                </cfif>         
        </cfif>    
      
    </cffunction>



    <cffunction name="getMovieName" access="remote" returnFormat = "json">
        <cfargument name="movie_name" type="string"  >
        <cfquery name="movie" result="movie_data" returntype="array">
            SELECT * FROM bookmymovie.movie_table
            WHERE movie_name=<cfqueryparam value="#arguments.movie_name#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>  
        <cfreturn movie_data> 
    </cffunction>

    <cffunction name="getTrailerUrl" access="remote" returnFormat = "json">
        <cfargument name="trailer_name" type="string"  >
        <cfquery name="trailer" result="trailer_data" returntype="array">
            SELECT * FROM bookmymovie.movie_table
            WHERE movie_trailer=<cfqueryparam value="#arguments.trailer_name#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>  
        <cfreturn trailer_data> 
    </cffunction>

    <cffunction name="movieDetails" access="public" output="true">
        <cfquery name="movie_details"  result="res">
            SELECT * FROM bookmymovie.movie_table;
        </cfquery>
        <cfreturn movie_details>
    </cffunction>

    <cffunction  name="getMovie" access="remote" returnformat="json" output="false">
        <cfargument name="id" type="numeric" required="true" />
        <cfquery name="getItem" datasource="newtech" returntype="array">
            SELECT * FROM bookmymovie.movie_table 
            WHERE id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn getItem />
    </cffunction> 

    <cffunction  name="getMovieDetails" access="remote"  output="false">
        <cfargument name="id" type="numeric" required="true" />
        <cfquery name="getItem" datasource="newtech" returntype="array">
        SELECT * FROM bookmymovie.movie_table 
        WHERE id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn getItem />
   </cffunction> 

   <cffunction name="deleteMovie" access="remote" output="true">
        <cfargument  name="id" type="string">     
        <cfset local.d_id=toString(toBinary(arguments.id))>
        <cftry>      
            <cfquery name="delete_movie"  result="theatre_movie">
                DELETE FROM bookmymovie.movie_table
                WHERE id=<cfqueryparam value="#local.d_id#" cfsqltype="CF_SQL_INTEGER">
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
        <cflocation url="../cfm/admin/list_movies.cfm?message=#local.msg#" addtoken="no">
</cffunction>

 <cffunction  name="addCast" access="remote"> 
    <cfargument  name="character_name" type="string">
    <cfargument  name="actor_name" type="string">
    <cfargument  name="actor_photo" type="string">
    <cfargument  name="mov_id" type="string">    
    <cfset local.mov_id=toBase64(arguments.mov_id)>         
            
    <cfif arguments.character_name eq "" || 
        arguments.actor_name eq "" ||       
        arguments.actor_photo eq "">
        <cfset local.msg=hash('2','sha')>       
        <cflocation url="../cfm/admin/manage_crew.cfm?mov_id=#local.mov_id#&message=#local.msg#" addtoken="no"> 
    </cfif> 

    <cfquery name="character_exists" result="char_res">
        SELECT character_name 
        FROM bookmymovie.movie_cast_table 
        WHERE 
        character_name=<cfqueryparam value="#arguments.character_name#" cfsqltype="CF_SQL_VARCHAR">
        AND
        movie_id =<cfqueryparam value="#arguments.mov_id#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>

    <cfquery name="actor_exists" result="actor_res">
            SELECT actor_name 
            FROM bookmymovie.movie_cast_table
            WHERE 
            actor_name=<cfqueryparam value="#arguments.actor_name#" cfsqltype="CF_SQL_VARCHAR">
            AND 
            movie_id =<cfqueryparam value="#arguments.mov_id#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>

    <cfif char_res.RecordCount NEQ 0>
        <cfset local.msg=hash('10','sha')>
        <cflocation url="../cfm/admin/manage_crew.cfm?movie_id=#local.mov_id#&message=#local.msg#" addtoken="no"> 
    </cfif> 

    <cfif actor_res.RecordCount NEQ 0>
        <cfset local.msg=hash('11','sha')>
        <cflocation url="../cfm/admin/manage_crew.cfm?movie_id=#local.mov_id#&message=#local.msg#" addtoken="no"> 
    </cfif>     
    <cfif len(trim(arguments.actor_photo))>
        <cffile action="upload" 
                fileField="form.actor_photo"  
                destination="C:\ColdFusion2021\cfusion\wwwroot\movieticket\assets\movies\actors" 
                result="actorUpload" 
                nameconflict="overwrite">

        <cfif actorUpload.filesize lt 1000000>            
            <cfset local.actor=actorUpload.serverfile >
        <cfelse>
            <cfset local.status=hash('6','sha')>  
            <cflocation url="../cfm/admin/manage_crew.cfm?movie_id=#local.mov_id#&message=#local.msg#" addtoken="no"> 
        </cfif>                  
    </cfif>
                            
    <cfquery datasource="newtech" result="result">
        INSERT INTO bookmymovie.movie_cast_table
        (    movie_id,
            character_name,
            actor_name,                        
            actor_photo                              
        ) 
            VALUES 
            (   <cfqueryparam value="#arguments.mov_id#" cfsqltype="cf_sql_varchar">,                          
                <cfqueryparam value="#arguments.character_name#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.actor_name#" cfsqltype="cf_sql_varchar">,                 
                <cfqueryparam value="#local.actor#" cfsqltype="cf_sql_varchar">
                )
    </cfquery>
        <cfif result.generatedkey>
            <cfset local.msg=hash('4','sha')>
            <cflocation url="../cfm/admin/manage_crew.cfm?movie_id=#local.mov_id#&message=#local.msg#" addtoken="no"> 
        <cfelse>
            <cfset local.msg=hash('5','sha')>
           <cflocation url="../cfm/admin/manage_crew.cfm?movie_id=#local.mov_id#&message=#local.msg#" addtoken="no"> 
         </cfif>             
</cffunction> 

<cffunction name="castDetails" access="public" output="true">  
    <cfargument  name="movId" type="string">  
        <cfquery name="cast_details" datasource="newtech">
            SELECT * FROM bookmymovie.movie_cast_table
            WHERE 
            movie_id= <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#arguments.movId#">
        </cfquery>
    <cfreturn cast_details>
</cffunction> 

<cffunction name="deleteCast" access="remote" output="true">
    <cfargument  name="id" type="string">    
    <cfargument  name="mov_id" type="string">  
    <cfset local.d_id=toString(toBinary(arguments.id))>
        <cfset local.mov_id=toString(toBinary(arguments.mov_id))>
    <cftry>      
        <cfquery name="delete_cast"  result="res_cast">
            DELETE FROM bookmymovie.movie_cast_table
            WHERE cast_id=<cfqueryparam value="#local.d_id#" cfsqltype="CF_SQL_INTEGER">
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
    <cfset local.msg=hash('3','sha')>    
    <cflocation url="../cfm/admin/manage_crew.cfm?movie_id=#arguments.mov_id#&status=#local.msg#" addtoken="no"> 
</cffunction>  

 <cffunction  name="addCrew" access="remote"> 
    <cfargument  name="role_name" type="string">
    <cfargument  name="person_name" type="string">
    <cfargument  name="crew_photo" type="string">
    <cfargument  name="mov_id" type="string">
    <cfset local.mov_id=toBase64(arguments.mov_id)>        
        <cfif arguments.role_name eq "" || 
                arguments.person_name eq "" ||       
                arguments.crew_photo eq "" 
                >
            <cfset local.msg=hash('2','sha')>
            <cflocation url="../cfm/admin/manage_crew.cfm?mov_id=#local.mov_id#&message=#local.msg#" addtoken="no"> 
        </cfif>  
    
        <cfif len(trim(arguments.crew_photo))>
            <cffile action="upload" 
                    fileField="form.crew_photo"  
                    destination="C:\ColdFusion2021\cfusion\wwwroot\movieticket\assets\movies\crew" 
                    result="crewUpload" 
                    nameconflict="overwrite">

            <cfif crewUpload.filesize lt 1000000>            
                <cfset local.crew=crewUpload.serverfile >
            <cfelse>
                <cfset local.status=hash('6','sha')>  
                <cflocation url="../cfm/admin/manage_crew.cfm?movie_id=#local.mov_id#&message=#local.msg#" addtoken="no"> 
            </cfif>                  
        </cfif>
                                
        <cfquery datasource="newtech" result="result">
            INSERT INTO bookmymovie.movie_crew_table
            (   movie_id,
                role_name,
                person_name,                        
                crew_photo                              
            ) 
                VALUES 
                (   <cfqueryparam value="#arguments.mov_id#" cfsqltype="cf_sql_varchar">,                          
                    <cfqueryparam value="#arguments.role_name#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.person_name#" cfsqltype="cf_sql_varchar">,                 
                    <cfqueryparam value="#local.crew#" cfsqltype="cf_sql_varchar">
                    )
        </cfquery>
        <cfif result.generatedkey>
            <cfset local.msg=hash('8','sha')>
            <cflocation url="../cfm/admin/manage_crew.cfm?movie_id=#local.mov_id#&message=#local.msg#" addtoken="no"> 
        <cfelse>
            <cfset local.msg=hash('5','sha')>
           <cflocation url="../cfm/admin/manage_crew.cfm?movie_id=#local.mov_id#&message=#local.msg#" addtoken="no"> 
         </cfif>     
     </cffunction> 

    <cffunction name="crewDetails" access="public" output="true">  
       <cfargument  name="movId" type="string">  
          <cfquery name="crew_details" datasource="newtech">
                SELECT * FROM bookmymovie.movie_crew_table
                WHERE 
                movie_id= <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#arguments.movId#">
            </cfquery>
        <cfreturn crew_details>
    </cffunction> 

    <cffunction name="deleteCrew" access="remote" output="true">
        <cfargument  name="id" type="string">    
        <cfargument  name="mov_id" type="string">  
        <cfset local.d_id=toString(toBinary(arguments.id))>
         <cfset local.mov_id=toString(toBinary(arguments.mov_id))>
        <cftry>      
            <cfquery name="delete_crew"  result="res_crew">
                DELETE FROM bookmymovie.movie_crew_table
                WHERE crew_id=<cfqueryparam value="#local.d_id#" cfsqltype="CF_SQL_INTEGER">
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
        <cfset local.msg=hash('3','sha')>    
        <cflocation url="../cfm/admin/manage_crew.cfm?movie_id=#arguments.mov_id#&status=#local.msg#" addtoken="no"> 
</cffunction> 

<cffunction  name="getActiveMovieDetails" access="remote"  output="false">
    <cfargument name="id" type="numeric" required="true" />     
    <cfquery name="getItem" datasource="newtech" returntype="array">
    SELECT * FROM bookmymovie.movie_table 
    WHERE id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer">
    </cfquery>
    <cfreturn getItem />
</cffunction> 

<cffunction  name="upcomingMovieDetails" access="public"  output="true">
    <cfset Today = #dateFormat(Now(),"yyyy-mm-dd")#>
    <cfquery name="getItem" datasource="newtech"  result="res">
        SELECT id,release_date,movie_name,movie_format,movie_language,movie_poster,
        movie_duration FROM bookmymovie.movie_table 
        WHERE release_date >= <cfqueryparam value="#Today#" cfsqltype="cf_sql_date">
    </cfquery>
    <cfreturn getItem />
</cffunction> 

<cffunction  name="movieAllDetails" access="public"  output="true">   
  <cfargument name="id" type="numeric" required="true" /> 
 
    <cfquery name="getItem" datasource="newtech"  result="res">
        SELECT DISTINCT m.movie_name,m.movie_poster,
                m.movie_language,m.release_date,
                m.movie_duration,m.movie_trailer,
                m.movie_format,movie_wallpaper,
                m.movie_des,m.genre,ct.character_name,m.id,
                ct.actor_name,ct.actor_photo,
                cr.role_name,cr.person_name,cr.crew_photo
                FROM bookmymovie.movie_table m
                INNER JOIN bookmymovie.movie_cast_table ct ON m.id =ct.movie_id 
                INNER JOIN bookmymovie.movie_crew_table cr ON m.id =cr.movie_id 
        WHERE 
         m.id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
         GROUP BY m.movie_name
    </cfquery>
    <cfreturn getItem />
</cffunction>  

<cffunction  name="getCastDetails" access="remote"  output="false">
    <cfargument name="id" type="numeric" required="true" />     
    <cfquery name="getCast" datasource="newtech" >
    SELECT * FROM bookmymovie.movie_cast_table 
    WHERE movie_id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer">
    </cfquery>
    <cfreturn getCast/>
</cffunction> 

<cffunction  name="getCrewDetails" access="remote"  output="false">
    <cfargument name="id" type="numeric" required="true" />     
    <cfquery name="getItem" datasource="newtech" >
    SELECT * FROM bookmymovie.movie_crew_table 
    WHERE movie_id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer">
    </cfquery>
    <cfreturn getItem />
</cffunction> 

 </cfcomponent>       