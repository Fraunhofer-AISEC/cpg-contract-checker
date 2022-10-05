pragma solidity ^0.8.11;



 contract CarFactory {

     Car[] deployedCars;

   function createCar(uint _seats,uint _doors,uint _wheels,string memory 
       _name) public {
   Car newCar=new Car(this,_seats,_doors,_wheels,_name);
   deployedCars.push(newCar);  
 }

  function getDeployedCars() public view returns (Car[] memory) {
    return deployedCars;
  }

 
  }


  contract Car {

  CarFactory  factory;

   bool made;
   string name;
   uint wheels;
   uint doors;
   uint seats;

 constructor(CarFactory  _factory,uint _seats,uint _doors,uint 
 _wheels,string memory _name) {
   factory=_factory;
   name=_name;
   wheels=_wheels;
   doors=_doors;
   seats=_seats;
 }

  function makeTrue() public {
   made=true;
 }

 }
