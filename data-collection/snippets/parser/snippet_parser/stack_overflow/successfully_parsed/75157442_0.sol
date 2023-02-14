
pragma solidity ^0.8.8;

contract FunWithStorage {
    uint256 public favoriteNumber = 20; 
    string private test = "hello1adsfdsfds";
    bool public someBool = false; 


    uint256[] public myArray;
    uint256[] public testArray;

    bool public testing = true;

    
    mapping(uint256 => bool)
        public myMap; 
    uint256 constant NOT_IN_STORAGE = 123;
    uint256 immutable i_not_in_storage;

    constructor() {
        favoriteNumber = 25; 
        someBool = false; 
        myArray.push(222); 
        myArray.push(201); 
        myArray.push(220); 
        testArray.push(100);
        testArray.push(100);

        testArray.push(100);

        myMap[0] = true; 
        myMap[1] = true; 
        myMap[2] = true; 

        i_not_in_storage = 123;
    }
}

