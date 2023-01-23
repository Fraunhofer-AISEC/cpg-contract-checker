pragma solidity ^0.4.17;

    contract FantasyLeague {
        
        address public member;
        
        uint[] public proposals;

        
        constructor() public {
            member = msg.sender;
        }

        
        function proposeNumber (uint) public payable {
            require(msg.value > .01 ether);
            proposals.push(msg.data);
        }

        
        function getProposals () public view returns (uint[]) {
            return proposals;
        }
    }
