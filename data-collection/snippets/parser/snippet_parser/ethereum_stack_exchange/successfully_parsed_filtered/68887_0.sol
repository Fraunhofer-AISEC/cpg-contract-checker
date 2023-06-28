contract BasaltStore {
  
  struct documentStore {
    
    uint256 id;
    
    string ipfsHash;
    
    address uploader;
    
    uint dateUploaded;
  }

  
  mapping (uint64 => documentStore) public ListOfDocuments; 
  
  uint256 public documentCount;

  
  function sendDocument(
    string memory _ipfsLocation, 
    uint256 _uploadDate,
    uint64 _key
  ) 
  public
  {
    documentCount ++;
    ListOfDocuments[_key] = documentStore(documentCount, _ipfsLocation, msg.sender, _uploadDate);
  }

  
  function getDocument(
    uint64 _id
  ) 
  public 
  view
  returns (string memory, address, uint256)
  {
    
    string memory ipfsHash = ListOfDocuments[_id].ipfsHash;
    address uploader = ListOfDocuments[_id].uploader;
    uint256 dateUploaded = ListOfDocuments[_id].dateUploaded;
    return (ipfsHash, uploader, dateUploaded);
  }
}
