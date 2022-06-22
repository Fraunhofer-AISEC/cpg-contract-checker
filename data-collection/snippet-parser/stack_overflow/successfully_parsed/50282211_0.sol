pragma solidity ^0.4.11;

contract MyContract {
    bytes32 public customer;
    bytes32 public location;
    bytes32 public product;
    bytes32 public reorderAmount;
    bytes32 public usdLitrePrice;
    bytes32 public usdTotalPrice;
    bytes32 public timestamp;

    function setOrder(bytes32 _customer, bytes32 _location, bytes32 _product, bytes32 _reorderAmount, 
                    bytes32 _usdLitrePrice, bytes32 _usdTotalPrice, bytes32 _timestamp) public {

        customer = _customer;
        location = _location;
        product = _product;
        reorderAmount = _reorderAmount;
        usdLitrePrice = _usdLitrePrice;
        usdTotalPrice = _usdTotalPrice;
        timestamp = _timestamp;
    }

    function getOrder() public constant returns (bytes32, bytes32, bytes32, bytes32, bytes32, bytes32, bytes32) {
        return (customer, location, product, reorderAmount, usdLitrePrice, usdTotalPrice, timestamp);
    }
}
