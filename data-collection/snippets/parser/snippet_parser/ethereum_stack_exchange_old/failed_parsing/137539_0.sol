contract MyCoin is ERC20 {
....
....
function _beforeTokenTransfer( address from, address to, uint256 amount ) internal virtual override { 
  if(.......){
     revert("....")
  }
