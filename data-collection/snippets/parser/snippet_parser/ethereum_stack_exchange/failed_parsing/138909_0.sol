
mapping(bytes32 => mapping(uint => Order[]) public orderBook;
mapping(bytes32 => mapping(uint => bool) public cancelOrder;

function cancelOrder(bytes32 ticker, uint id) external {
  Order[] storage orders = orderBook[ticker][id];

  

  
  cancelOrder[ticker][id] = true;
}

