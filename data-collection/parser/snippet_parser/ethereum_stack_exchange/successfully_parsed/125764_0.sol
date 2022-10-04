function mint(address _account, uint256 _quantity) external payable callerIsUser{
        uint price = PRICE;
        require(price != 0, "price connot be 0");
        require((totalSupply() + _quantity) <= MAX_SUPPLY, "Y :: Beyond Max Supply");
        require(msg.value >= (PRICE * _quantity), "Y :: not enough funds ");
        _safeMint(_account, _quantity);
    }
