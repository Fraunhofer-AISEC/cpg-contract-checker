contract changer{


       habibconcert firstObject =    habibconcert(0x692a70d2e424a56d2c6c27aa97d1a86395877b3a);

       interfacer public changers;

      function changeTickets(uint new_tickets)  {


       

          changers.changeTickets_numberTicket(new_tickets);

        
        
        
  }


    function displayTickets_numbers()constant returns(uint){

               return displayTickets_numbers();
    }


    }




interface interfacer{


    function changeTickets_numberTicket(uint new_tickets);

    function displayTickets_numbers() constant returns(uint);


}




contract habibconcert{

      uint  public tickets = 6;

      address owner_of_tickets;

      uint constant price = 1 ether;

       mapping(address=>uint) public purchasers;

      function habibconcert()payable{

            owner_of_tickets =  msg.sender;
      }


                function  displayTickets_numbers()constant returns(uint){

                    return tickets;


                }






              function changeTickets_numberTicket (uint newtickets) {

                         tickets +=newtickets;

                   }











        modifier ownLycreature(){


            require(msg.sender ==  owner_of_tickets) ;

            
            _;

            }



               function changeTickets_number (uint newtickets) ownLycreature{

                         tickets +=newtickets;

                   }




    function buytickets(uint amount)payable{

          if(msg.value!=(amount*price) || amount>tickets){

              throw;
          }

          purchasers[msg.sender] +=amount;

          tickets -=amount;


        

        

        


    }        





}
