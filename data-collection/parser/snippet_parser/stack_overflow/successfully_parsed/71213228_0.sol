
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;
import "./SimpleStorage.sol";

contract StorageFactory is SimpleStorage {
    SimpleStorage[] public simpleStorageArray;
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }
    function sFStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);

    }
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();

    }
    struct addrToValue{
        address addr;
        uint256 value;
    }
    addrToValue[]  addressesArray;    

    function printAddresses() public returns(addrToValue[] memory){
        for(uint256 _ssArrIndex=0; _ssArrIndex<simpleStorageArray.length; _ssArrIndex++){
            addrToValue memory addressTov;
            addressTov.addr = address(simpleStorageArray[_ssArrIndex]);
            addressTov.value = SimpleStorage(address(simpleStorageArray[_ssArrIndex])).retrieve();
            addressesArray.push(addressTov);
            
        }
        return addressesArray;
    }
}
