contract CarFactory {

    Car[] deployedCars;
 
    function createCar() public {
       Car newCar=new Car(this);
       deployedCars.push(newCar);  
     }

     function getDeployedCars() public view returns (Car[] memory) {
       return deployedCars;
     }

     function getDeployedCarsWhereTrue() public view returns (Car[] memory) {
       return deployedCars 
     }
}


contract Car {

      CarFactory  factory;

       bool made;
    
     constructor(CarFactory  _factory) {
       factory=_factory;
     }

      function makeTrue() {
       made=true;
     }

}
