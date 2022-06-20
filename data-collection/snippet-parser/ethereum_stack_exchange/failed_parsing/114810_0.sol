abstract contract Mintable is IBase {
   function mintCoins(uint amount, address to, uint timestamp) public
    onlyMinter
  {
    
    hasRole(THECOIN_ROLE, to); <-- Undeclared identifier
