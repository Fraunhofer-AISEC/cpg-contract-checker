contract GoodToken {
    address public dummy1;
    address public dummy2;
    uint256 public dummy3;
    function detectTransferRestriction(address x, address y, uint256 z) public {
        dummy1 = x;
        dummy2 = y;
        dummy3 = z;
    }
}

contract BadToken {
    address public dummy1;
    address public dummy2;
    uint256 public dummy3;
    function someOtherFunc(address x, address y, uint256 z) public {
        dummy1 = x;
        dummy2 = y;
        dummy3 = z;
    }
}
