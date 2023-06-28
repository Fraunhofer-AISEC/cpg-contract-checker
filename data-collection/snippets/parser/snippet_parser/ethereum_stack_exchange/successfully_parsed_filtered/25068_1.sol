contract OtherContract {
    function otherMethod(address _to, uint _price);
}

contract MyContract {
    uint public unitPrice = 100;

    function myMethod(address _destination, uint _count) {
        
        OtherContract oc = OtherContract(_destination);
        
        oc.otherMethod(address(this), _count * unitPrice);
    }
}
