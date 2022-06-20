function buyNFT(uint _id) public payable{
    
    address payable _seller = ownerOf(_id);

    
    approve(_seller, _id);
    setApprovalForAll(msg.sender, true);

    
    transferFrom(_seller, msg.sender, _id);

    
    address(_seller).transfer(msg.value);

    emit NftBought(_seller, msg.sender, msg.value);

  }
