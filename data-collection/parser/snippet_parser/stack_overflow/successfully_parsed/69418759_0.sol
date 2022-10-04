function createContract(E.BKLiteMeta memory meta)         
          public 
          payable
          returns(address) 
    {
        require(meta.publisherAddress == msg.sender, "only pub");
        return(address(new BKopyLite(meta)));
    }
