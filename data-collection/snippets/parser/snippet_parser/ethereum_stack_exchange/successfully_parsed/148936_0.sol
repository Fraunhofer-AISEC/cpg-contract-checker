
pragma solidity 0.8.17;

struct Order {
    address trader;
    uint256 amount;
}

contract Test {
    event Received(address, uint256);

    function openPosition(Order calldata order) external payable {
        emit Received(order.trader, msg.value);
    }
}

