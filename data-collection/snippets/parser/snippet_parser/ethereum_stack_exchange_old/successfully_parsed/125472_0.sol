    function verifyMyVote(string calldata _partyName) public view returns (string memory _nicop, uint _voterIndex)  {
            address ethAdd = candidateContractReference.getCandidateDataFromPartyName(_partyName);
            require(ethAdd != address(0),"No Candiate Found for this Party (function verifyMyVote)"); 

            for(uint loop=0; loop < votersMapping[ethAdd].length; loop++) {
                    if(votersMapping[ethAdd][loop].voterEthAddress == msg.sender) {
                            return (votersMapping[ethAdd][loop].nicop,loop);
                    }
            }
    }
