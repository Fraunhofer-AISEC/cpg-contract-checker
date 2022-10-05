function addCar(string _make, string _model, unit _pricePerDay, uint _minRentalDay, uint _maxRentalDay) public onlyOwner{

make = _make;
model = _model;
pricePerDay = _pricePerDay;
minRentalDay = _minRentalDay;
maxRentalDay = _maxRentalDay;

Car newCar = cars[numofCars];
nameToKeys[name].keys.push(numofCar); 

newCar.VechileOwner = msg.sender;
newCar.make = make;
newCar.model = model;
newCar.available = false;
newCar.pricePerDay = pricePerDay;
newCar.minRentalDay = minRentalDay;
newCar.maxRentalDay = maxRentalDay;

NewCar(numofCars,msg.sender);
ids.push(numofCars);
numofCars++;
}
