uint256 startTokenId = _currentIndex; 
 if (to == address(0)) revert MintToZeroAddress(); 
 if (quantity == 0) revert MintZeroQuantity(); 
  
 _beforeTokenTransfers(address(0), to, startTokenId, quantity); 
  
 
 
 
 unchecked { 
     _addressData[to].balance += uint64(quantity); 
     _addressData[to].numberMinted += uint64(quantity); 
  
     _ownerships[startTokenId].addr = to; 
     _ownerships[startTokenId].startTimestamp = uint64(block.timestamp); 
  
     uint256 updatedIndex = startTokenId; 
     uint256 end = updatedIndex + quantity; 

}