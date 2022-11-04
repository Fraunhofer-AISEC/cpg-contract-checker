    event TradeCreated(address indexed tradeAddress);

    function createTrade(string memory _name ,uint _price) public {
        Trade newTrade = new Trade(_name, _price, _currencyAddress, msg.sender);
        products[msg.sender].push(product(_name, address(newTrade)));
        emit TradeCreated(address(newTrade));
    }
