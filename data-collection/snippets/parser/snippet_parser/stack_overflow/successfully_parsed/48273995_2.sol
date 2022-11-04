function validVoters() public view returns (bool) {
    for(uint i = 0; i < voters.length ; i++){
       if (voters[i] == msg.sender) {
            return false;
       } 
    }
    return true;
}
