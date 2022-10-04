pragma solidity 0.6.0;

contract CarFactory {

  Car[] deployedCars;

  mapping(address=>bool) mechanics ;

 function createCar(string memory _name) public {
    Car newCar=new Car(this, _name);
    deployedCars.push(newCar);   
 }

 function getDeployedCars() public view returns (Car[] memory) {
    return deployedCars;
 }

 function becMechanic() public {
    mechanics[msg.sender]=true;
 }

 function getMechanic(address  _user) public view returns(bool) {
    return(mechanics[_user]) ;
 }

}


contract Car {

 CarFactory  factory ;
     string  carName;

  constructor(CarFactory  _factory, string memory _name) public {

    factory = _factory ;
    carName = _name;
  }

  function changeName(string memory name) public {

    require(factory.getMechanic(msg.sender)==true);

                    carName=name;
  }

}

