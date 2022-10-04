function test() public payable returns(uint){
        require(getContractBalance() >= msg.value.add(msg.value).add(_foo), "Not enough eth in contract");
        _foo= _foo.add(msg.value.mul(5).div(1000));
        return _foo;
    }
