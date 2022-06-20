pragma solidity ^0.4.24;

contract Transfer {

    constructor () public payable {
        
        require(msg.value == 1000);
    }

    function done() public {
        address(0).transfer(1); 
    }

    function fail() public {
        address(1).transfer(1); 
    }

    function send(address account) public {
        account.transfer(1); 
    }

}
