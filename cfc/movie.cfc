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
                            release_date=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.release_date#">,
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
                                    <cfqueryparam value="#arguments.release_date#" cfsqltype="cf_sql_varchar">,
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
 </cfcomponent>       