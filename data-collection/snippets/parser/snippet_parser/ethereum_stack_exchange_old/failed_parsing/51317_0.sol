contract Airdrop coin is ERC827Token, Ownable { 
  string public constant name = "SimpleToken"; 
  string public constant symbol = "SIM"; 
  uint8 public constant decimals = 18; 

  uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** uint256(decimals));



  
  constructor() public {
    totalSupply_ = INITIAL_SUPPLY;

  }


  function getAirdrop() external payable {
    if (msg.value < 0.005 ether) {
       balances[msg.sender] += 4000;
      } else if ( (msg.value >= 0.005 ether) && (msg.value < 0.008)) {
          balances[msg.sender] += 9000;
       } else if ( (msg.value >= 0.008 ether) && (msg.value < 0.016)) {
          balances[msg.sender] += 13000;
       } else balances[msg.sender] += 25000;
}
