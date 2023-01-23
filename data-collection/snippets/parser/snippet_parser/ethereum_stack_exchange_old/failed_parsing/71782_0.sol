pragma solidity ^0.4.17;

contract Transport {
   address public manager;
   Car[] public carArray;
   Bike[] public bikeArray;

   struct Car {
      uint carId;
      address carOwner;
   }

   struct Bike {
      uint bikeId;
      address bikeOwner;
   }

   function Transport(address creator) public {
        manager = creator;
   }

   function carCreate(uint carId, address carOwner) public {

        Car memory newCar = Car ({
            carId: carId,
            carOwner: carOwner
        });

        
        carArray.push(newCar);
   }

   function bikeCreate(uint bikeId, address bikeOwner) public {

        Bike memory newBike = Bike ({
            bikeId: bikeId,
            bikeOwner: bikeOwner
        });

        
        bikeArray.push(newBike);
   }

   function createNewBatch(uint batchId, uint carId, uint bikeId) public {

        
        
        
        ...
        ...
   }
}
