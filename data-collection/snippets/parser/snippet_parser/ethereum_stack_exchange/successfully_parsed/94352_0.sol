contract RF20 is Context, IERC20 {
    
    
    
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
    
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    
    
}


contract RF721 is ERC721{
    
    
    
    
    address addressRF20;
    function setAdressRF20(address _addressRF20) external {
        addressRF20 = _addressRF20;
    }
    
    
    function approver() public {
        RF20 contr = RF20(addressRF20);
        contr.approve(0x88849EBf42C66B86cCA7397f0E52824E6e96839a, 50);
    }
    
    
    function send() public {
        RF20 token = RF20(addressRF20);
        token.transfer(0x88849EBf42C66B86cCA7397f0E52824E6e96839a, 50);
    }
    
    
}
