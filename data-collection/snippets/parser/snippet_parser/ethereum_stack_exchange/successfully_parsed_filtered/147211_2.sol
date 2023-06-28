
uint256 lastMileageIndex = cars[_licensePlate].mileageHistory.length - 1;
uint256 lastMileage = cars[_licensePlate].mileageHistory[lastMileageIndex];
require(_mileage > lastMileage, "Odometer only goes forward");
