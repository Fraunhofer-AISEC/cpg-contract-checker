


pragma solidity >=0.6.0 <0.9.0;

import "./SimpleStorage.sol";

contract ArbFactory {

    SimpleStorage[] public SimpleStorageArr;

    function CreateNewContract() public{

        
        SimpleStorage newContract = new SimpleStorage(); 
        
        SimpleStorageArr.push(newContract);

    }

    function functionCallOne(uint256 _SimpleStorageIndex, uint256 _SimpleStorageNumber) public{
        

        SimpleStorage manCon = SimpleStorage(address(SimpleStorageArr[_SimpleStorageIndex]));
        
        

        manCon.store(_SimpleStorageNumber);

    }

    function functionCallTwo(uint256 _SimpleStorageIndex) public view returns(uint256){
        SimpleStorage manCon = SimpleStorage(address(SimpleStorageArr[_SimpleStorageIndex]));
        return manCon.retrieve();
    }

}

