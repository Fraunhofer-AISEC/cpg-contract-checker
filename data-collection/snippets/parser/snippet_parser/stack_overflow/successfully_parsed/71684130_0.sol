    pragma solidity 0.8.7;



contract Movie{
   address public owner;  

 struct Move{

   uint year;

   uint price;
}
 
   mapping (string => Move ) public movieInfo;
   mapping(uint => Move) amount;

   constructor()  payable{
      owner= msg.sender;
   }

   function addMovie(string memory _title, uint _year, uint _price) public {
      require( msg.sender==owner);

      movieInfo[_title]= Move(_year, _price);
   }

   
}