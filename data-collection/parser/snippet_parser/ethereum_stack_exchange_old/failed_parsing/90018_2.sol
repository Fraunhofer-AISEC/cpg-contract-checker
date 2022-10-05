function signDocument(int id) public payable {
        if(msg.value != signaturePrice) {
            revert();
        }
        if(id <= lastId) {
            documents[uint256(id)].signatures.push(msg.sender);
