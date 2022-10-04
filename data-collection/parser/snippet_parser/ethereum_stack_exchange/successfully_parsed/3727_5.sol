contract Child {
    address public addr;

    function child (address _addr) {
        addr = _addr;
    }    

    function getAddress() returns (address) {
        return addr;
    }

    function toBytes(address x) returns (bytes b) {
        b = new bytes(20);
        for (uint i = 0; i < 20; i++) {
            b[i] = byte(uint8(uint(x) / (2**(8*(19 - i)))));
        }
    }

    function getName() returns (string) {
        return string(toBytes(addr));
    }
}

contract Parents {
    address public childAddr;
    Child child;

    function Parents(address _childAddress) {
        child = Child(_childAddress);
        childAddr = child.getAddress();
    }
}
