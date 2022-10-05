pragma solidity 0.4.24;

contract  A{
    uint256 a;
    function set(uint _a) public { 
        require(_a > 100);
        a = _a;
    }

}

contract C {
    function callA(A _a, uint256 _value) public {
        bool success = address(_a).call(abi.encodeWithSignature("set(uint256)", _value));
        emit ACalled(success);
    }

    event ACalled(bool success);
}
