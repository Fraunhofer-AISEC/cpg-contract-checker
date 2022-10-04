
pragma solidity ^0.8.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Lottery is Ownable {
    
   uint256 constant ticketprice = 1 ether;
   address  pool = addresshere;
   uint ID = 0;
   uint256 startinglottery;
   
   struct Picket { 
   uint ID;
   uint[6] ticket;
   }
   
   mapping (address => Picket) hope;
   address[] players;
   
    constructor() {
    startinglottery = 0;
    }
    
    
    function StartLottery() public onlyOwner {
    startinglottery = 1;  
    }
    
    function EndLottery() public onlyOwner {
        
    startinglottery = 0;
    }
    
    function BuyTicket(address _address) public payable {
        
        require(msg.value >= ticketprice, "not enought money!");
        require(startinglottery == 1, "lottery isn't started.");
        
        payable(pool).transfer(msg.value);
        
        Picket memory picket = hope[_address];
        picket.ID = ID;
        picket.ticket = [1,2,3,4,5]; 
        players.push(_address);
        ID++;
        
    }
    
    function getTicket(address _address) public view returns(uint, uint[6] memory) {
        return (hope[_address].ID, hope[_address].ticket);
    }

    
}
