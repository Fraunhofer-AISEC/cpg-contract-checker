 function getDeployedCarsWhereTrue() public view returns (Car[] memory) {
   uint count = getCount();
   Car[] memory result =  new Car[](count);;
   for(uint i = 0; i < deployedCars.length; i ++){
     if(deployedCars[i].made){
       result.push(deployedCars[i]);
     }
   }
   return result;
 }

function getCount() internal view returns (uint) {
  uint count;

  for (uint i = 0; i < deployedCars.length; i++) {
    if(deployedCars[i].made){
        count++;
    }
  }

  return count;
}
