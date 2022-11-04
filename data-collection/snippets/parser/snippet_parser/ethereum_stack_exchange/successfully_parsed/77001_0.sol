    enum Operation {
        BUY,
        SELL
    }
    struct OrderItem {
        address token;
        uint256 weightIfBuyAmountIfSell;
        uint256 minEthIfSell;
        uint256 deadline;
        Operation op;
    }
    function placeOrder(OrderItem[] memory _order) public payable{
        
    }

