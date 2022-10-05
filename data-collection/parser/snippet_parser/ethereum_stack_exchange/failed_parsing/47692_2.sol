contract Mycontract{
    uint public sellprice;
    uint public buyprice;
    address public admin;

    constructor(uint _sellprice, uint _buyprice) {
        sellprice = _sellprice;
        buyprice = _buyprice;
        admin = msg.sender;
    }

    function sell()...

    function buy()..


}
