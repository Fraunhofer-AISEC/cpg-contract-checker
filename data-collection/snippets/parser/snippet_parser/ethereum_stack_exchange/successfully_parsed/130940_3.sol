
pragma solidity 0.8.8;

import "./SimpleStorage.sol";

contract StorageFactory{
    SimpleStorage[] simpleStorageArray;

    struct People{
        string name;
        uint256 age;
    }

    People[] people;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfSetPerson(uint256 contractAddressIndex, string memory _name, uint256 _age) public {
        SimpleStorage simpleStorage = simpleStorageArray[contractAddressIndex];
        simpleStorage.setPerson(_name, _age);
    }

    function sfGetPerson(uint256 contractAddressIndex) public view returns (SimpleStorage.People[] memory){
        SimpleStorage simpleStorage = simpleStorageArray[contractAddressIndex];
        return simpleStorage.getPerson();
    }

}
