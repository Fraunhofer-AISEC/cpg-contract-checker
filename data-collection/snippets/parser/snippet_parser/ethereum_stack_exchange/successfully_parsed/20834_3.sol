pragma solidity ^0.4.11;
contract TA2_Transfer {
    address public sender;
    address public receiver;
    uint public packageCount;

    mapping (address => uint) public balances;
    event Transfer(address from, address to, uint objCount);

    function sendToReceiver(address sender, address receiver, uint256 objCount) 
        payable 
        returns(bool success) 
    {
        
        balances[sender] -= objCount;
        balances[receiver] += objCount;
        Transfer(sender, receiver, objCount);
        return true;
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
    event Sent(address sender, address origin, address shipper, address carrier, address receiver, uint objCount);

    function ShippingOrder(address TA2) {
        t = TA2_Transfer(TA2);
        oBalances[msg.sender] = 200;
    }
    function getBalance(address _sender) returns(uint) {
        return oBalances[_sender];
    }
    function sendOrder(address oOrigin, address oShipper, address oCarrier,  address oReceiver, uint256 oCount) 
        payable 
        returns(bool success) 
    {
        if(!t.sendToReceiver(oOrigin, oShipper, oCount)) throw;
        if(!t.sendToReceiver(oShipper, oCarrier, oCount)) throw;
        if(!t.sendToReceiver(oCarrier, oReceiver, oCount)) throw;
        Sent(msg.sender, oOrigin, oShipper, oCarrier, oReceiver, oCount);
        return true;
    }
}
