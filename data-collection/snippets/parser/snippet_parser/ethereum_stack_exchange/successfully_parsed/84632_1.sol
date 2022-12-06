pragma solidity 0.5.17;

contract StoreIDToAddress {
    
    mapping(uint => address) public numToAddress;

    
    function getAddresses(uint16[] calldata  _IDs) external view returns (address[] memory) {
        address[] memory arr = new address[](_IDs.length);
        
        for (uint i; i < _IDs.length; i++) {
            arr[i] = numToAddress[_IDs[i]];
        }
        
        return arr;
    }

    
}
