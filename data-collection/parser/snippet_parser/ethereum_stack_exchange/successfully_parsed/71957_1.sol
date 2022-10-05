pragma solidity ^0.5.8;
import "./Test1.sol";

contract Test2 {

    Test1 test1;
    function carAdd(string memory _carCreationDate, string memory _carOrigin, address _carOwner) public returns(uint) {
        uint carId = test1.setNewCar(_carCreationDate, _carOrigin, _carOwner);
        return (carId);
    }
}
