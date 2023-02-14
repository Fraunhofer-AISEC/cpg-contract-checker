mapping (bytes32 => Document) documents;
bytes32[] public documentHashMap;

function setDocument(bytes32  _hash, string memory _documentName, bytes32 _documentHash) public {
     Document memory document = documents[_hash];

     document.id = documentCount++;
     document.documentName = _documentName;
     document.documentHash = _documentHash;
     document.sender = msg.sender;

    documentHashMap.push(_hash) -1;
}

function getDocumentByHash(bytes32 _hash) view public returns(uint, string memory, bytes32, address) {
    return (documents[_hash].id, documents[_hash].documentName, documents[_hash].documentHash, documents[_hash].sender);
}
