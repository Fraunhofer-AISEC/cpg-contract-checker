 address owner; 
function test (string _name)public view returns(bool){
  
    owner = msg.sender; 
    return owner == address(this);
}
