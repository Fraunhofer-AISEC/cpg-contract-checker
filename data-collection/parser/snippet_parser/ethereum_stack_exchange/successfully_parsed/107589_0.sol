pragma solidity ^0.5.0; 

contract supply {

    address payable Supplier;
    address payable Producer;
    uint constant payment_unit = 1 ether;
    uint public price_feature1_wei = 0;
    string public features_product1;
    bool public SellSuplier = true;
    bool public contract_terminated = false;

    constructor () public payable {
        Supplier = msg.sender;
        features_product1 = "product description...";

    }

    function PriceFeature1 (uint amount) public {
        require (SellSuplier == true);
        require (Supplier == msg.sender);
        price_feature1_wei = amount * payment_unit;
    }

    function PurchaseFeature1() public payable {
        require (price_feature1_wei > 0);
        require (msg.value == price_feature1_wei);
        require (SellSuplier == true);
        require (Producer == msg.sender);
        require (Supplier.send(msg.value));
        SellSuplier = false;
    }
}
