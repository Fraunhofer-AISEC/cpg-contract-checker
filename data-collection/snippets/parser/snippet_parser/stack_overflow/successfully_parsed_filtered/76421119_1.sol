
pragma solidity ^0.8.0;

contract TestArray {
    struct Order {
        address from;
        address to;
    }

    function setOrder(Order calldata) external {}

    function setOrders(Order[] calldata) external {}

    function setOrderss(Order[][] calldata) external {}

    
}
