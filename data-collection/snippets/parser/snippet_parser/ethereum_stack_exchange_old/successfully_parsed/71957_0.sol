pragma solidity ^0.5.8;

contract Test1 {

   struct Car {
       string carCreationDate;
       string carOrigin;
       address carOwner;
   }

   mapping(uint => Car) public CarStruct;

   function setNewCar(string memory _carCreationDate, string memory _carOrigin, address _carOwner) public returns(uint) {
       uint carId = uint(keccak256(abi.encodePacked(msg.sender, now)));
       CarStruct[carId].carCreationDate = _carCreationDate;
       CarStruct[carId].carOrigin = _carOrigin;
       CarStruct[carId].carOwner = _carOwner;
       return carId;
   }
}
