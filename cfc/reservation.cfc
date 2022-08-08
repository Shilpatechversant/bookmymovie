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
        <cfargument name="total_seats" type="string">

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
            SELECT res.seat_num as seats        
            FROM bookmymovie.reservation_table res                 
            WHERE res.show_id=<cfqueryparam value="#arguments.ch_show_id#" cfsqltype="CF_SQL_INTEGER">
            AND res.show_date = <cfqueryparam value="#arguments.cdate#" cfsqltype="cf_sql_date"> 
        </cfquery>       
        <cfset MyNewArray = ArrayNew(1,false)>           
        <cfloop query="book_details">
            <cfset ArrayAppend(MyNewArray, #seats#)>
        </cfloop>          
        <cfset seats_taken = #ArrayToList(MyNewArray)#>    
        <cfreturn seats_taken>
    </cffunction>

    <cffunction name="setBooking" access="remote">
        <cfargument  name="seats" type="string">
        <cfargument  name="tprice" type="string">
        <cfargument  name="time_sl" type="integer">
        <cfargument  name="show_id" type="integer">
        <cfargument  name="theatre_id" type="integer">
        <cfargument  name="date" type="date">
        <cfargument  name="show_date" type="date">

        <cfset local.today= DateFormat(Now(),"yyyy-mm-dd")>

        <cfset sh_id=toBase64(arguments.show_id)>
        <cfset tp=toBase64(arguments.tprice)>
        <cfset ts=toBase64(arguments.time_sl)>
        <cfset pdate=toBase64(arguments.date)>
        <cfset seat_num=toBase64(arguments.seats)>

        <cfset local.seat_split =arguments.seats.Split(",")>
        <cfset local.seat_num=ArrayLen(seat_split)>
        <cfquery name="select_seat" result="select_res">
            SELECT * FROM bookmymovie.reservation_table WHERE 
            seats=<cfqueryparam value="#arguments.seats#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif select_res.RecordCount EQ 0>
       
            <cfquery name="reserve" result="reserve_res">
                    INSERT into bookmymovie.reservation_table(
                        theatre_id,
                        show_id,
                        booked_on,
                        customer_id,
                        show_date,
                        seats,
                        seat_num,                       
                        time_slot,                    
                        price,
                        paid,
                        payment_status
                    )
                    VALUES
                       (
                            <cfqueryparam value="#arguments.theatre_id#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="#arguments.show_id#" cfsqltype="CF_SQL_INTEGER">,
                            <cfqueryparam value="#local.today#" cfsqltype="CF_SQL_DATE">,
                            <cfqueryparam value="#Session.userId#" cfsqltype="CF_SQL_INTEGER">,
                            <cfqueryparam value="#arguments.date#" cfsqltype="CF_SQL_DATE">,
                            <cfqueryparam value="#arguments.seats#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="#local.seat_num#" cfsqltype="CF_SQL_VARCHAR">,                        
                            <cfqueryparam value="#arguments.time_sl#" cfsqltype="CF_SQL_VARCHAR">,                       
                            <cfqueryparam value="#arguments.tprice#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="0" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="pending" cfsqltype="CF_SQL_VARCHAR">
                        )
            </cfquery>
            <cfif reserve_res.RecordCount EQ 1>
                <cfset reserve_id=reserve_res.GENERATED_KEY>
                <cflocation  url="../cfm/user/payment.cfm?reserve_id=#toBase64(reserve_id)#" addtoken="no">       
            </cfif>
        </cfif>



    </cffunction>

    <cffunction name="getReservation" access="remote">
        <cfargument name="id" type="integer">
        <cfquery name="reserve_res" result="reserve">
            SELECT r.seats,r.seat_num,r.booked_on,r.show_date, r.price ,r.show_id,r.id,
            m.movie_name,m.movie_language,m.genre,m.movie_format,
            th.theatre_name,th.theatre_address,
            s.screen_name,
            sh.theatre_id,sh.total_seats,
            st.show_time,st.show_name,
            m.id as m_id , sh.id as sh_id, s.id as s_id , st.id as st_id ,th.id as th_id
            FROM bookmymovie.reservation_table r INNER JOIN manage_shows sh ON r.show_id=sh.id
            INNER JOIN bookmymovie.screen_time_table st ON st.id=r.time_slot
            INNER JOIN bookmymovie.theatre th ON th.id=sh.theatre_id
            INNER JOIN bookmymovie.movie_table m ON m.id=sh.movie_id
            INNER JOIN bookmymovie.screen_table s ON s.id=sh.screen_id
            WHERE r.id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>        
        <cfreturn reserve_res>
    </cffunction>


</cfcomponent>