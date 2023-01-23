    

    function tokenToNft() public payable {
        _transfer(address(this), msg.sender, 1);   
    }

    function nftToToken() public payable {
        _transfer(address(this), msg.sender, 1);   
    }
