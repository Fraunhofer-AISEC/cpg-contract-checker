pragma solidity ^0.4.17;

contract FantasyLeague {
    
    address public commissioner;
    
    uint[] public proposals;
    
    address[] public members;
    
    address[] public rightsGiven;

    
    constructor() public payable {
        commissioner = msg.sender;
    }

    function giveRightToVote(address voter) public {
        require(msg.sender == commissioner);
        
        rightsGiven.push(voter);
    }

    
    function vote (uint number) public payable {
        
        require(msg.value > .01 ether);
        proposals.push(number);
        members.push(msg.sender);
    }

    
    function getVotes () public view returns (uint[]) {
        return proposals;
    }

    
    function getRightsToVote () public view returns (address[]) {
        return rightsGiven;
    }

    
    
    function getMembers () public view returns (address[]) {
        return members;
    }
}
