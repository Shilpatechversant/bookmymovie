<cfinclude  template="user_header.cfm">
<cfparam  name="reserve_id" default="0">
<cfset id=toString(toBinary(reserve_id))>
<cfset ticket_res=application.obj.getBookDetails(id)>
<cfoutput query="ticket_res">

<section class="container text-dark">
            <div class="order-container">
                <div class="order pt-3">
                    <img class="order__images" alt='' src="assets/user_template/images/logo.jpg">
                    <p class="order__title text-white">Thank you <br><span class="order__descript">you have successfully purchased tickets</span></p>
                </div>

                <div class="ticket">
                    <div class="ticket-position bg-white">
                        <div class="ticket__indecator indecator--pre"><div class="indecator-text pre--text">online ticket</div> </div>
                        <div class="ticket__inner">

                            <div class="ticket-secondary">
                                <h1 class="text-center text-uppercase">#theatre_name#</h1>
                                <span class="ticket__item">Ticket number : <strong class="ticket__number">#ticket_id#</strong></span>
                                <span class="ticket__item ">Show date: <strong>#dateFormat(select_date,"full")#</strong></span>
                                <span class="ticket__item ">Show: <strong>#timeFormat(start_time)#</strong></span>
                                <span class="ticket__item">Language: <strong><span class="ticket__hall">#language#-#movie_format#</strong></span></span>
                                <span class="ticket__item">Screen: <strong><span class="ticket__hall">#screen_name#</strong></span></span>
                                <span class="ticket__item ">price: <strong class="ticket__cost">Rs #price#</strong></span>
                            </div>

                            <div class="ticket-primery">
                                <span class="ticket__item ticket__item--primery ticket__film">Movie<br><strong class="ticket__movie">#movie_name#</strong></span>
                                <span class="ticket__item ticket__item--primery">Seats: <span class="ticket__place">#seats#</span></span>
                                <span class="ticket__item ">Number of Tickets:  <span class="ticket__place">#seat_num#</span></span>
                                <span class="ticket__item ">Printed On:  <span class="ticket__place">#dateFormat(book_date)# #timeformat(book_time,"hh:mm:ss ")#</span></span>
                                <h3>Confirmed</h3>
                            </div>


                        </div>
                        <div class="ticket__indecator indecator--post"><div class="indecator-text post--text">online ticket</div></div>
                    </div>
                </div>

                <div class="ticket-control">
                    <a href="download_file.cfm?id=#id#" class="btn btn-showing">Download</a>
                    <a href="index.cfm" class="btn btn-showing">Back to Home</a>
                </div>

            </div>
        </section>
        </cfoutput>
<cfinclude  template="user_footer.cfm"> 