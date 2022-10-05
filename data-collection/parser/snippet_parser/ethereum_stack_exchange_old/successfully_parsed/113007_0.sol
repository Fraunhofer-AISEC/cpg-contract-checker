
pragma solidity ^0.8.9;

interface A {  
    function interfaceFunction() external returns(uint256);
}

contract B is A {
    function interfaceFunction() public virtual override returns (uint256) {
        return 1;
    }
}

contract C {
    B implementsInterface;
    
    constructor(B _implementsInterface) {
        implementsInterface = _implementsInterface;
    }
    
    function asParameter(A _interface) public returns (uint256) {
        return _interface.interfaceFunction();
    }
    
    function asProperty() public returns (uint256) {
        return asParameter(implementsInterface);
    }
}
