 function isVotingAgain(address _addr) private view returns(bool) {
        for(uint i = 0; i < voters.length; i++){
            if(voters[i] == _addr){
                return true;
            }
        }
        return false;
    } 
