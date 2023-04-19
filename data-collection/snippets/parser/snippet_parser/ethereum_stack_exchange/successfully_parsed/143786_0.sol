
pragma solidity ^0.8.0;

import "./SimpleStoragePractice.sol";

contract SimpleStorageFactoryPractice {

    SimpleStoragePractice simpleStoragePractice;

    SimpleStoragePractice[] public ssfpArray;

    function addToSSFPArray () public {
        simpleStoragePractice = new SimpleStoragePractice();
        ssfpArray.push(simpleStoragePractice);
    }

    function storeToArray(uint _index, string memory _name) public {
       ssfpArray[_index].store(_name);
    }
  
}  
