   function verifyMessage(string memory message, 
      bytes memory signature) 
      public view  returns(bool) {
      
        
        bytes32 messagehash =  keccak256(bytes(message));
        
        bytes32 messagehash2 = keccak256(abi.encodePacked("\x19Ethereum Signed Messsage:\n32", messagehash));
        
        address signeraddress = ECDSA.recover( messagehash2, signature);
        if (msg.sender==signeraddress) {
            
            return true;
        } else {
            
            return false;
        }
    }
