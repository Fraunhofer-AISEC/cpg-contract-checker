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
}