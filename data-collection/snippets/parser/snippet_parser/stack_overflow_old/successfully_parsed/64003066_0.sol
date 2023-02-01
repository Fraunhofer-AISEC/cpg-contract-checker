pragma solidity ^0.7.0;
        
contract Name {
    
    string name = "Tom";
    
    function getName() public view returns (string memory) {
        return name;
    }
}
