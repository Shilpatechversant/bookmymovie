 <cfcomponent name="reservation">  
   <cffunction name="getBookings" access="remote" returnFormat = "json" >    
        <cfargument  name="showId" type="integer">          
        <cfquery name="show_details" result="show_data" returntype="array" >
            SELECT COUNT(res.id) as num_seats, res.id as rs_id,res.seat_num,m.total_seats,m.id         
            FROM bookmymovie.reservation_table res
            INNER JOIN bookmymovie.manage_shows m ON res.show_id =m.id       
            WHERE res.show_id=<cfqueryparam value="#arguments.showId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>  
        <cfreturn show_details> 
    </cffunction>

    <cffunction name="ShowBookview" access="remote"  output="false">
        <cfargument  name="ch_show_id" type="integer"> 
        <cfargument  name="cdate" type="date"> 
        <cfargument  name="seats" type="string"> 
        <cfargument name="total_seats" type="integer">

        <cfif arguments.total_seats GT arguments.seats>
            <cfset local.seat_num=toBase64(arguments.seats)>
            <cfset local.show_id=toBase64(arguments.ch_show_id)>
            <cfset local.date=toBase64(arguments.cdate)>

            <cflocation  url="../cfm/user/booking_step.cfm?seat_num=#local.seat_num#&show_id=#local.show_id#&date=#local.date#" addtoken="no">
        <cfelse>
            <cfset local.status=hash('10','sha')>
            <cflocation  url="../cfm/user/error_form.cfm?message=#local.status#" AddToken="no"> 

        </cfif>
    </cffunction>

    <cffunction name="getBookedSeats" access="remote"  output="false">
        <cfargument  name="ch_show_id" type="integer"> 
        <cfargument  name="cdate" type="date"> 

        <cfquery name="book_details" result="book_data">
            SELECT COUNT(res.id) as num_seats, res.id as rs_id,res.seat_num as seats        
            FROM bookmymovie.reservation_table res
            INNER JOIN bookmymovie.manage_shows m ON res.show_id =m.id       
            WHERE res.show_id=<cfqueryparam value="#arguments.ch_show_id#" cfsqltype="CF_SQL_INTEGER">
            AND res.show_date = <cfqueryparam value="#arguments.cdate#" cfsqltype="cf_sql_date"> 
        </cfquery> 
    
     
        <cfloop query="book_details">
            <cfset listAppend(seats_taken,#seats#)>
        </cfloop>            
        <cfreturn seats_taken>
    </cffunction>
</cfcomponent>