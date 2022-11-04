contract A {
    address public addr;
    bool public success;
    bytes public result;

function setAddr(address _addr) public {
    addr = _addr;
}


function callB(uint256 arg1, uint256 arg2) public {
    (success, result) = addr.staticcall(abi.encodeWithSignature("funcB(uint256, uint256)", arg1, arg2));
}

}
