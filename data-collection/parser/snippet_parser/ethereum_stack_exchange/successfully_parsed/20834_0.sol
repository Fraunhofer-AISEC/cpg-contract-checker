pragma solidity ^0.4.11;

contract TA2_Transfer {
    address public sender;
    address public receiver;
    uint public packageCount;
    mapping (address => uint) public balances;
    event Transfer(address from, address to, uint objCount);
    function sendToReceiver(address sender, address receiver, uint256 objCount) payable {
        if (balances[sender] < objCount) return;
        balances[sender] -= objCount;
        balances[receiver] += objCount;
        Transfer(sender, receiver, objCount);
    }
    function getBalance(address _sender) returns(uint) {
        return balances[_sender];
    }
}

contract ShippingOrder{
    TA2_Transfer public t;
    address public oOrigin;
    address public oShipper;
    address public oCarrier;
    address public oReceiver;
    uint public oCount;
    mapping (address => uint) public oBalances;
    event Sent(address shipper, address carrier, address receiver, uint objCount);
    function ShippingOrder() {
        oBalances[tx.origin] = 200;
    }
    function getBalance(address _sender) returns(uint) {
        return oBalances[_sender];
    }
    function sendOrder(address oOrigin, address oShipper, address oCarrier,  address oReceiver, uint256 oCount) payable{
        t.sendToReceiver(oOrigin, oShipper, oCount);
        t.sendToReceiver(oShipper, oCarrier, oCount);
        t.sendToReceiver(oCarrier, oReceiver, oCount);
    }
}
