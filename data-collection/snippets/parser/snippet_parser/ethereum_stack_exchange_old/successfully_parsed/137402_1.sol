
pragma solidity 0.8.7; 

contract example {
    mapping (bytes32=>bool) isTheStringAlreadyAdded; 
    uint  public i; 


function addCategory(string memory _string) public {
    isTheStringAlreadyAdded[keccak256(abi.encodePacked(_string))] = true;
}

    function checkCategory (string memory _string) public {
        require(isTheStringAlreadyAdded[keccak256(abi.encodePacked(_string))] == false, "This category has already been added");
       i+=1;  
    }
}
