   on line number 39-40 
     browser/ballot.sol:39:9: TypeError: Type struct 
  DocumentManager.Document storage ref is not implicitly convertible 
   to expected type uint256.
    uint256 document = documents[documentId];
    ^--------------------------------------^

  browser/ballot.sol:40:12: TypeError: Member "owner" not found or not 
  visible after argument-dependent lookup in uint256.
    if(document.owner == msg.sender) {
       ^------------^
