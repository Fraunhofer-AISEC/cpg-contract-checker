address owner;

 modifier onlyOwner() {
    require(msg.sender == owner);
    _;
}

constructor(address _owner){
owner = _owner;
}


function MyOwnedFunction(address arg1, uint arg2) public onlyOwner {
  
}
