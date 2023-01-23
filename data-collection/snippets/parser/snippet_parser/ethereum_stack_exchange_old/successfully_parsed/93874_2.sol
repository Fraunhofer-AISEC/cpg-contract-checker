pragma solidity ^0.7.4;


import "./Vote.sol";
 
contract VoteFactory{
    address[] public deployedVotes;
    
    function createVote(uint typeOf) public{
        address newVote = address(new Vote(msg.sender, typeOf));
        deployedVotes.push(newVote);
    }

    function getDeployedVotes() public view returns (address[] memory) {
        return deployedVotes;
    }
    
}

