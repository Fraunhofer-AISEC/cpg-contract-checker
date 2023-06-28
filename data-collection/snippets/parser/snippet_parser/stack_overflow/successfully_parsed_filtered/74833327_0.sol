function DeleteProgram(string memory _programCode) public {
   require(owner==msg.sender,"You are not Admin");
   require(programs[_programCode].isActive, "Invalid program code");
    uint i=0;
     while (i<allprograms.length){
        if(keccak256(bytes(allprograms[i].programCode)) == keccak256(bytes(_programCode))){
          if(i!=(allprograms.length-1)){
            allprograms[i]=allprograms[allprograms.length-1];
          }
            allprograms.pop();
          return;}
        i++;}
        }
function allPrograms() public view returns (program [] memory) {
      require(owner==msg.sender,"You are not Admin");
    return allprograms;
}
