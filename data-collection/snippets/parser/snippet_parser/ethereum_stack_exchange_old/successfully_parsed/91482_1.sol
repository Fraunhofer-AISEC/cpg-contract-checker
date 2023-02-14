
pragma solidity >=0.5.16 <0.7.0;

contract MyContract {
  struct Document {
    string title;
    address payable uploader;
    uint256 price;
    string description;
    string file;
  }

  string myContractHash;

  Document[] public documents;

  mapping(address => uint256[]) public filesUploaded;
  mapping(address => uint256[]) public documentsPublished;
  mapping(address => uint256[]) public documentsPurchased;

  
  function setHash(string memory ipfsHash) public {
    myContractHash = ipfsHash;
  }

  
  function getHash() public view returns (string memory ipfsHash) {
    return myContractHash;
  }

  function getDocument(uint256 i) public view returns (Document memory) {
    return documents[i];
  }

  function getDocumentsPublishedTotal(address user) public view returns (uint256) {
    return documentsPublished[user].length;
  }

  function getDocumentsPublished(address user, uint256 i) public view returns (uint256) {
    return documentsPublished[user][i];
  }

  function getDocumentsPurchasedTotal(address user) public view returns (uint256) {
    return documentsPurchased[user].length;
  }

  function getDocumentsPurchased(address user, uint256 i) public view returns (uint256) {
    return documentsPurchased[user][i];
  }

  function publishDocument(
    string memory title,
    uint256 price,
    string memory description,
    string memory file
  ) public {
    require(bytes(title).length > 0 && bytes(title).length < 20, "Invalid title length");
    require(bytes(description).length > 0 && bytes(description).length < 10000, "Invalid description length");

    documents.push(Document(title, msg.sender, price, description, file));
    documentsPublished[msg.sender].push(documents.length);
  }

  function isDocumentPurchased(uint256 i) public view returns (bool) {
    for (uint256 j = 0; j < documentsPurchased[msg.sender].length; j++) {
      if (documentsPurchased[msg.sender][j] == i) return true;
    }
    return false;
  }

  function purchaseDocument(uint256 i) setPause public payable {
    require(msg.sender != documents[i].uploader && !isDocumentPurchased(i));

    require(msg.value == documents[i].price, "Invalid price");

    documents[i].uploader.transfer(msg.value);

    documentsPurchased[msg.sender].push(i);
  }
}
