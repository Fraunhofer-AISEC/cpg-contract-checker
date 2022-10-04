function addNewDocument(string hash, string name){
    Document memory doc =  Document(hash,name,bytes32ToString(bytes32(now)),0);
    bytes32  hashed = keccak256(hash,name);
    Documents[hashed]=Document(hash,name,bytes32ToString(bytes32(now)),0);
    DocumentAddresses.push(hashed);
    UserHashes[msg.sender].push(hashed);
}
