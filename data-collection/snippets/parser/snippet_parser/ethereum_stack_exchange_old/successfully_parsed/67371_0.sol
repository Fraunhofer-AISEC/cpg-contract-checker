function getCarArray(uint _carId) 
        public 
        view 
        returns (uint[12] memory) 
    {
        CarData memory car = cars[_carId];

        uint[12] memory carInfo;

        carInfo[0] = car.statusEnd;
        carInfo[1] = car.number;
        carInfo[2] = car.load;
        carInfo[3] = car.capacity;
        carInfo[4] = car.region;
        carInfo[5] = car.status;
        carInfo[6] = car.abrasion;
        carInfo[7] = car.repairs;
        carInfo[8] = uint(car.currentOwner);
        carInfo[9] = uint(car.movingTo);
        carInfo[10] = car.resourceType;
        carInfo[11] = car.resourceAmount;

        return carInfo;
    }
