
mapping(bytes32 => mapping(uint256 => Order)) private s_orders;
mapping(bytes32 => mapping(uint256 => bool)) public s_orderCancelled;

struct Order {
        uint256 id;
        address trader;
        Status status;
        bytes32 ticker;
        uint256 amount;
        uint256 filled;
        uint256 price;
        uint256 date;
    }

function cancelOrder(bytes32 _ticker, uint256 _id) external {
        Order storage orders = s_orders[_ticker][_id];

        if (address(orders.trader) != msg.sender) revert Exchange__NotOwner();
        if (orders.id == _id) revert Exchange__InvalidId();

        s_orderCancelled[_ticker][_id] = true;
    }
