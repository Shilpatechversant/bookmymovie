<cfparam name="id" default="0">
<cfinclude  template = "movie_header.cfm"  runOnce = "true">
<!---<cfset id=toString(toBinary(reserve_id))>--->
<cfset ticket_res=application.bookings.getBookDetails(id)>
<cfoutput query="ticket_res">
<section class="container text-dark">
            <div class="order-container">
                <div class="order pt-3">
                    <img class="order__images" alt='' src="assets/user_template/images/logo.jpg">
                    <p class="order__title text-white">Thank you <br><span class="order__descript">you have successfully purchased tickets</span></p>
                </div>
                <cfdocument  format="pdf" filename="ticket.pdf" overwrite="Yes">

                <div class="ticket">
                    <div class="ticket-position bg-white">
                        <div class="ticket__indecator indecator--pre"><div class="indecator-text pre--text">online ticket</div> </div>
                        <div class="ticket__inner">

                            <div class="ticket-secondary">
                                <h1 class="text-center text-uppercase">#theatre_name#</h1>
                                <p class="ticket__item">Ticket number : <strong class="ticket__number">#ticket_id#</strong></p>
                                <p class="ticket__item ">Show date: <strong>#dateFormat(booked_on,"full")#</strong></p>
                                <p class="ticket__item ">Show Time: <strong>#timeFormat(show_time)#</strong></p>
                                <p class="ticket__item">Screen: <strong><span class="ticket__hall">#screen_name#</strong></span></p>
                                <p class="ticket__item ">Price: <strong class="ticket__cost">Rs #price#</strong></p>
                            </div>
                            <div class="ticket-primery">
                                <span class="ticket__item ticket__item--primery ticket__film">
                                Movie: <strong class="ticket__movie">#movie_name#</strong>
                                    <p class="ticket__item">Language: <strong>
                                    <span class="ticket__hall">#movie_language#-#movie_format#</strong></span></p>                                </span>
                                <p class="ticket__item ticket__item--primery">Seats:<strong> <span class="ticket__place">#seats#</span></strong></p>
                                <p class="ticket__item ">Number of Tickets: <strong> <span class="ticket__place">#seat_num#</span></strong></p>
                                <p class="ticket__item ">Printed On:  <strong><span class="ticket__place ">#dateFormat(book_date)# #timeformat(book_time,"hh:mm:ss ")#</span></strong></p>
                                <h3>Confirmed</h3>
                            </div>
                        </div>                       
                    </div>
                </div>
                </cfdocument>
                <cfheader name="Content-Disposition" value="attachment;filename=ticket.pdf">
                <cfcontent type="application/octet-stream" file="#expandPath('.')#\ticket.pdf" deletefile="Yes">
            </div>
        </section>
        </cfoutput>
<cfinclude  template = "movie_footer.cfm"  runOnce = "true"> 