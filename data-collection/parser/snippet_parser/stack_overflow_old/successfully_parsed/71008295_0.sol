
pragma solidity ^0.8.0;


contract Testing{
    address payable public manager;

    constructor(){
         manager =payable(msg.sender);
    }

    function getMoneyFromManager(uint quantity) public payable{
        
        
    }

}
