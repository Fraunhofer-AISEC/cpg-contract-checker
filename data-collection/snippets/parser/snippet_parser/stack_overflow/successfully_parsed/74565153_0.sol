pragma solidity ^0.8.7;



contract Client  {
 
    address payable private hub;
    address payable public owner;
    uint256 public balance;

    
   
    constructor(address payable _hub) {
        hub = _hub;
        owner = payable(msg.sender);
    }
    
    receive() payable external {
        balance += msg.value;
    }    

  
    
    function withdraw(address payable destAddr) public {
        require(msg.sender == owner, "Only owner can withdraw funds"); 
        uint amount = address(this).balance;
        destAddr.transfer(amount);
    }
    
    function start() public payable {
        require(msg.sender == owner, "Only owner can start the process"); 
        uint amount = address(this).balance;
        hub.transfer(amount);
        balance = 0;
    }  

    function setHub(address payable  _new) public {
        require(msg.sender == owner, "Only owner can change address");
        hub = _new;   
    }  
}
