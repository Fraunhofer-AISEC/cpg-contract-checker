contract MyContract is IERC1155 {
  
  
  function _safeTransformFrom() internal virtual {
    
    emit TransferSingle() -- THIS LINE throws warning 
}
