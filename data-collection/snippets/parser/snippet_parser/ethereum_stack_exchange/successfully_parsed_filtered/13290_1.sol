pragma solidity ^0.4.9;

contract Offer {

address public owner;
struct Offer {
    string title;
    string description;
    uint  offerTime;
    mapping (address => uint) subscribers;
    mapping (uint => address) subscribersAddress;
    mapping (uint => uint) nbrSubscribersPerID;
    uint price;
}

Offer[] public  offers;



function addOffer(string  description1, string title1, uint price1,uint offerTime1) 
  returns (uint, string, string, uint, uint) {
    uint offerID = offers.length++;
    Offer o = offers[offerID];

    o.description = description1;
    o.offerTime=offerTime1;
    o.title = title1;
    o.price = price1;
    return (offerID, offers[offerID].description, offers[offerID].title, offers[offerID].price, 
      offers[offerID].offerTime);
}


function returnNbroffer() constant returns(uint) {
    uint nbr_offer =offers.length;
    return(nbr_offer);
}

function subscribeOffer(uint offerID) public payable  returns(address,uint,address)   {

      Offer o = offers[offerID];
      uint i=0;
      uint count=0;
         if (msg.value>= o.price)
           { address addre=msg.sender;
             offers[offerID].subscribersAddress[count=++i]=msg.sender;
             offers[offerID].subscribers[msg.sender]=now;
             return(addre,offers[offerID].subscribers[msg.sender],offers[offerID].subscribersAddress[i]);


            }
    offers[offerID].nbrSubscribersPerID[offerID]=count;



}
  function expirationOffer(uint offerID) constant  returns(bool,uint,uint)
  { 
     Offer o = offers[offerID];
     bool expire=false;
     uint timenow=now;
     uint timeSpent=offers[offerID].subscribers[msg.sender]+o.offerTime ;
     if (timenow > timeSpent )
       {expire=true;}
   return(expire,timenow,timeSpent);
   }
 }
