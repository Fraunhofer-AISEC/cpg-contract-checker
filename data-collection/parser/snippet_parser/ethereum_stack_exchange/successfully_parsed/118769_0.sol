struct Document {
  address payable uploader;
  
}

Document[] public documents;

function purchaseDocument(uint256 docIndex) public payable {
  require(msg.sender != documents[docIndex].uploader && !isDocumentPurchased(docIndex), "Please purchase this document first");
  require(msg.value == documents[docIndex].fee, "Invalid amount paid");

  
  payable(documents[docIndex].uploader).transfer(msg.value);

  
}
