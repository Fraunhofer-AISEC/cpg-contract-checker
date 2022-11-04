function sendDocument(
    string memory _ipfsLocation, 
    uint256 _uploadDate 
) 
public 
returns (uint256)
{
    documentCount ++;
    ListOfDocuments[documentCount] = documentStore(documentCount, _ipfsLocation, msg.sender, _uploadDate);
    return documentCount ;
}
