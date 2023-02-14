contract A is Ownable { 
  constructor() {
    owner = msg.sender; 
    approve(msg.sender, totalSupply); 
  }      

  function transferFrom(address from, address to, uint256 value) public returns (bool) {
    require(value <= allowed[from][msg.sender], "Not allowed!");
    
  }
}    

contract B is Ownable { 
  A contractA = ETC20(0x111);
  address payable X = 0x333;

  constructor() {
    owner = msg.sender; 
  }

  function giveAwayTokens(uint256 value) {
    contractA.transferFrom(owner, X, value);
  }
}
