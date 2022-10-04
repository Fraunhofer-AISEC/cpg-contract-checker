struct Voter {
            string voterName;
            uint256 cnic;
            uint256 voteConstituency;
            bool authorize;
            bool isVoter;
        }
        mapping(address => Voter []) voterList;
        address[] voterAddressArray;
        
           
        function getVoterInfo() public view returns(Voter[] memory) {
            uint index = voterAddressArray.length;
            Voter[] memory voter;
            for(uint i=0; i < index; i++) {
                voter[i] = voterList[voterAddressArray[i]];
                return voter;
            }
        }  
