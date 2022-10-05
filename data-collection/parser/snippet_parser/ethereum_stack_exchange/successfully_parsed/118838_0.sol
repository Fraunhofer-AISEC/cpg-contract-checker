contract CarFactory {
Car[] deployedCars;
mapping(address=>bool) mechanics;

function createCar(string memory _name) public {
    Car newCar=new Car(_name);
    deployedCars.push(newCar);
    
}
function getDeployedCars() public view returns (Car[] memory) {
    return deployedCars;
}
function becMechanic() public {
    mechanics[msg.sender]=true;
}}





contract Car {

string carName;

constructor(string memory _name){
    carName =_name;
}

function changeName(string memory name) public {
    require(mechanics[msg.sender]==true);
    carName=name;
}

}
