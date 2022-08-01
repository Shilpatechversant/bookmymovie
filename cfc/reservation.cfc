 <cfcomponent name="reservation">  
   <cffunction name="getBookings" access="remote" returnFormat = "json" >    
        <cfargument  name="showId" type="integer">          
        <cfquery name="show_details" result="show_data" returntype="array" >
            SELECT res.id as rs_id,res.seat_num,m.total_seats,m.id         
            FROM bookmymovie.reservation_table res
            INNER JOIN bookmymovie.manage_shows m ON res.show_id =m.id       
            WHERE res.show_id=<cfqueryparam value="#arguments.showId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>  
        <cfreturn show_details> 
    </cffunction> 
</cfcomponent>