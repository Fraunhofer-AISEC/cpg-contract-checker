pragma solidity ^0.4.0;


contract changer{


   habibconcert firstObject =    habibconcert(0xdc544654fefd1a458eb24064a6c958b14e579154);

  function changeTickets(uint new_tickets) returns(uint) {


      firstObject.tickets = new_tickets;

      uint updateTickets =  firstObject.tickets  = firstObject.tickets + new_tickets;
      return ( updateTickets);

        }


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
