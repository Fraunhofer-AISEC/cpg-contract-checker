contract OrderBook {
    OrderStruct[] public buyOrderBook;
    OrderStruct[] public sellOrderBook;


    struct OrderStruct {
        uint price;
        uint quantity;
        address sender;
    }

    
    function buy(uint _maxPrice, uint _amount) {
        while (_amount > 0) {
            if (_maxPrice >= sellOrderBook[sellOrderBook.length - 1].price) {
                
                
                
            } else {
                addBuyToBook(_maxPrice, _amount);
            }
        }
    }

    
    function sell(uint _minPrice, uint _amount) {
        while (_amount > 0) {
            if (_minPrice >= buyOrderBook[buyOrderBook.length - 1].price) {
                
                
                
            } else {
                addSellToBook(_minPrice, _amount);
            }
        }
    }

    
    
    function addBuyToBook(uint _maxPrice, uint _amount) private returns(bool success){
        if (buyOrderBook.length == 0) {
            buyOrderBook.push(OrderStruct({
                    price: _maxPrice,
                    quantity:_amount,
                    sender: msg.sender}));
            return true;
        }
        uint iterLength = buyOrderBook.length - 1;
        for (uint i = 0; i <= iterLength; i++) {
            if (_maxPrice > buyOrderBook[iterLength - i].price) {
                if (i == 0) {
                    buyOrderBook.push(OrderStruct({
                        price: _maxPrice,
                        quantity:_amount,
                        sender: msg.sender}));
                    return true;
                } else {
                    buyOrderBook.push(buyOrderBook[iterLength]);
                    for (uint j=0; j < i; j++) {
                        buyOrderBook[iterLength - j + 1] = buyOrderBook[iterLength - j];
                    }
                    buyOrderBook[iterLength - i + 1] = OrderStruct({
                        price: _maxPrice,
                        quantity:_amount,
                        sender: msg.sender});
                    return true;
                }
            }
        }
        buyOrderBook.push(buyOrderBook[iterLength]);
        for (uint k=0; k < iterLength + 1; k++) {
            buyOrderBook[iterLength - k + 1] = buyOrderBook[iterLength - k];
        }
        buyOrderBook[0] = OrderStruct({
            price: _maxPrice,
            quantity:_amount,
            sender: msg.sender});
        return true;
    }

    
    
    function addSellToBook(uint _minPrice, uint _amount) private returns(bool success){
        if (sellOrderBook.length == 0) {
            sellOrderBook.push(OrderStruct({
                    price: _minPrice,
                    quantity:_amount,
                    sender: msg.sender}));
            return true;
        }
        uint iterLength = sellOrderBook.length - 1;
        for (uint i = 0; i <= iterLength; i++) {
            if (_minPrice < sellOrderBook[iterLength - i].price) {
                if (i == 0) {
                    sellOrderBook.push(OrderStruct({
                        price: _minPrice,
                        quantity:_amount,
                        sender: msg.sender}));
                    return true;
                } else {
                    sellOrderBook.push(sellOrderBook[iterLength]);
                    for (uint j=0; j < i; j++) {
                        sellOrderBook[iterLength - j + 1] = sellOrderBook[iterLength - j];
                    }
                    sellOrderBook[iterLength - i + 1] = OrderStruct({
                        price: _minPrice,
                        quantity:_amount,
                        sender: msg.sender});
                    return true;
                }
            }
        }
        sellOrderBook.push(sellOrderBook[iterLength]);
        for (uint k=0; k < iterLength + 1; k++) {
            sellOrderBook[iterLength - k + 1] = sellOrderBook[iterLength - k];
        }
        sellOrderBook[0] = OrderStruct({
            price: _minPrice,
            quantity:_amount,
            sender: msg.sender});
        return true;
    }
    function OrderBook() {} 
}
