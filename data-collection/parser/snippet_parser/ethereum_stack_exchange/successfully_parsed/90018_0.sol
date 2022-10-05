function signDocument(int id) public payable {
        if(msg.value != signaturePrice) {
            revert();
        }
        if(id <= lastId) {
            documents[uint256(id)].signatures.push(msg.sender);

            
            documents[uint256(id)].signaturesSring += bytes32ToString(msg.value);
            

        }
        emit Status('Signed Document ID at Last row:', msg.sender, uint256(id));
        emit Status('New Signature On Document', msg.sender, block.timestamp);
        owner.transfer(address(this).balance);
    } 
