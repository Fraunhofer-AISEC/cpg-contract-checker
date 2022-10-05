
pragma solidity ^0.8.0;

contract Test {
    uint age;
    string varAge = "age";
    
    mapping(string=>uint) mapAges;

    
    function setAge() public {
        mapAges[varAge] = 30;
    }

    
    function getAge() external view returns(uint) {
        return mapAges[varAge];
    }

} 
