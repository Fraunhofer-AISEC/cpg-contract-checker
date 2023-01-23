bool isICOClosed; 

function mintTokenToUser(address user, uint value) internal {
  
  require( !isICOClosed);
  _token.mint(user, value);
}
