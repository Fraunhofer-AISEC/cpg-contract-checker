pragma solidity ^0.5.0;

contract A {
    function a() public returns(uint256) {
        return 2;
    }
}

contract B {
    address addrOfA;
    constructor (address _addrOfA) public {
        addrOfA = _addrOfA;
    }
    
    function b() public returns(uint256) {
        (bool success, bytes memory result) = address(addrOfA).delegatecall(abi.encodeWithSignature("a()"));
        require(success);
        
        return abi.decode(result, (uint256));
    }
}
