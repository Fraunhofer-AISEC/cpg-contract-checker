mapping (address => bool) submitted;
 
 function getSubmitted(address myAddress) public returns(bool){
     return submitted[myAddress];
 }
