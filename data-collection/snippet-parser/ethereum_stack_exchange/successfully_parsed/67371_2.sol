function getCarsInfo()
    public view
    returns (uint[] memory)
{   
    uint i;
    uint j = 0;
    uint carCount = 10; 
    uint[] memory carIdArray = new uint[](carCount);
    for (i = 0; i < carCount; i++){
        carIdArray[j] = i;
        j++;
    }

    uint lengthArray = carCount*12;
    uint[] memory allCarInfoBigArray = new uint[](lengthArray);
    i=0;
    for (j = 0; j < carIdArray.length; j++) {
        CarData memory car = cars[carIdArray[j]];

        allCarInfoBigArray[i] = car.statusEnd;
        allCarInfoBigArray[i+1] = car.number;
        allCarInfoBigArray[i+2] = car.load;
        allCarInfoBigArray[i+3] = car.capacity;
        allCarInfoBigArray[i+4] = car.region;
        allCarInfoBigArray[i+5] = car.status;
        allCarInfoBigArray[i+6] = car.abrasion;
        allCarInfoBigArray[i+7] = car.repairs;
        allCarInfoBigArray[i+8] = uint(car.currentOwner);
        allCarInfoBigArray[i+9] = uint(car.movingTo);
        allCarInfoBigArray[i+10] = car.resourceType;
        allCarInfoBigArray[i+11] = car.resourceAmount;
        i = i + 12;
    }
    return allCarInfoBigArray;
}
