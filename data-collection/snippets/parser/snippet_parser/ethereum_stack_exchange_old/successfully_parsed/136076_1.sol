
pragma solidity 0.8.16;

contract Contract {

    address[] public addresses;

    function getAddresses() public view returns(address[] memory) {
        return addresses;
    }

    
    function addAddress(address addr) public {
        addresses.push(addr);
    }

    
    function addAddresses(address[] calldata _addresses) public {
        addresses = _addresses;
    }

    
    function operate(address[] calldata _addresses) public pure {

        for(uint256 i = 0; i < _addresses.length; i++) {
            address addr = _addresses[i];
            
        }

    }

    
    function operateOnStorageArrayOfAddresses() public view {
        
        address[] memory addressesCopy = addresses;
        for(uint256 i = 0; i < addressesCopy.length; i++) {
            address addr = addressesCopy[i];
            
        }

    }

}
