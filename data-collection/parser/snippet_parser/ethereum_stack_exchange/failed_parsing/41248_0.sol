contract MyContract{
  mapping (uint => document) documents;

  struct document{
      address author;
      bytes32 hashedContent;
  }

  function addDocument(bytes32 docHash) public{
      document newDoc = document (msg.sender,docHash); 
      [...]
  }
}
