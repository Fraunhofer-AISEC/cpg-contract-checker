pragma solidity >=0.4.22 <0.7.0;

contract Ballot {
    address owner;
    
    constructor() public {
        owner = msg.sender;    
    }
    
    function assignVoter(address voter) public {
        require(msg.sender == owner);
    }
}
