pragma solidity >=0.6.0;

contract Proxy {
    address registry = 0xc5c97AAd92a962396229cbC8392e62585B04DfB3; 

    function implementation() public view returns(address) {
        return Registry(registry).getImplementationAddress();
    }

    fallback() external payable {
        address implementationAddress = implementation();
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, returndatasize(), calldatasize())
            let result := delegatecall(gas(), implementationAddress, ptr, calldatasize(), returndatasize(), returndatasize())
            returndatacopy(ptr, 0, returndatasize())

            switch result
            case 0 {revert(ptr, returndatasize())}
            default {return(ptr, returndatasize())}
        }
    } 
}

contract Registry {
    address public implementationAddress = 0x8750c1719E32294260e596c80a04818533e2C643; 

    function getImplementationAddress() public view returns(address) {
        return implementationAddress;
    }
}

contract Foo { 
    uint256 public a;
    uint256 public b;
    function setA(uint256 val) external {
        a = val;
    } 
    function setB(uint256 val) external {
        b = val;
    } 
    function getA() external view returns(uint256) { 
        return a;
    } 
    function getB() external view returns(uint256) {
       return b;
    } 
}
