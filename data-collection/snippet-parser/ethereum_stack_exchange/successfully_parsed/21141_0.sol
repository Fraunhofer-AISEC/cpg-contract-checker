pragma solidity ^0.4.11;
contract TA2_Transfer {
    address public sender;
    address public receiver;
    uint public packageCount;
    address owner;
    bytes32 name;
    mapping (address => uint) public balances;
    event Transfer(address from, address to, uint objCount);

    function sendToReceiver(address sender, address receiver, uint objCount) 
        payable 
        returns(bool success) 
    {
        balances[sender] -= objCount;
        balances[receiver] += objCount;
        Transfer(sender, receiver, objCount);
        return true;
    }
}
contract ShippingOrder{
    address public oOrigin;
    address public oShipper;
    address public oCarrier;
    address public oReceiver;
    mapping (address => uint) public obalances;
    event Bal (uint balance);
    function ShippingOrder() {
        obalances[tx.origin] = 200;
    }
    function getBalance(address sender) returns(uint) {
        Bal(obalances[sender]);
        return obalances[sender];
    }
    function sendOrder(address oOrigin, address oShipper, address oCarrier,  address oReceiver, uint oCount) 
        payable 
        returns(bool success) 
    {
        TA2_Transfer t= new TA2_Transfer();
        Bal(1);
        if(!t.sendToReceiver(oOrigin, oCarrier, oCount)) throw;
        if(!t.sendToReceiver(oCarrier, oShipper, oCount)) throw;
        if(!t.sendToReceiver(oShipper, oReceiver, oCount)) throw;
        return true;
    }
}
