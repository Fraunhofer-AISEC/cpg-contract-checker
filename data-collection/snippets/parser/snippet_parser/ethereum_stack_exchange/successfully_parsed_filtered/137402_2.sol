pragma solidity 0.8.7; 

contract example1 {
    mapping (bytes32=>bool) isTheStringAlreadyAdded;
    uint  public i; 
    error categoryisAlreadyAdded();


function addCategory(string memory _string) public {
    isTheStringAlreadyAdded[keccak256(abi.encodePacked(_string))] = true;
}

    function checkCategory (string memory _string) public {
        if(isTheStringAlreadyAdded[keccak256(abi.encodePacked(_string))] == true) {
         revert categoryisAlreadyAdded();
        }
        else {
        i+=1; 
        }
    }
}

