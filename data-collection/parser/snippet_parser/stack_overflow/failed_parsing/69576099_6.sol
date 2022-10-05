using ECDSA for bytes32; 

function verifyMessage(string memory message, bytes memory signature) public view  returns(address, bool) {
        
        bytes32 messagehash =  keccak256(bytes(message));
       
        address signeraddress = messagehash.toEthSignedMessageHash().recover(signature);
              
        if (msg.sender==signeraddress) {
            
            return (signeraddress, true);
        } else {
            
            return (signeraddress, false);
        }
    }
  

    
