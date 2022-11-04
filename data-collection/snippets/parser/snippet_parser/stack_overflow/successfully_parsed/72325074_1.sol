function mint(uint256 _amount) public payable {
        require(msg.value == _amount * mintPrice, 'wrong mint value');
        require(totalSupply + _amount <= maxSupply, 'Sold out');
        _mint(msg.sender, 0, _amount, "");
        totalSupply = totalSupply + _amount;
    }
