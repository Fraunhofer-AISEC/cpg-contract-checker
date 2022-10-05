  struct AllAutomobiles {
    uint carId;
    uint vinNumber;
    string miscId;
    string licenseInfo;
    string vehicleDescription;
  }

  AllAutomobiles [] public cars;

  uint public autoMobileCount = 0;



function enterAutomobiles(uint vinNumber, string memory miscId, string memory licenseInfo, string memory vehicleDescription) public onlyOwner {
    cars.push(AllAutomobiles(autoMobileCount, vinNumber, miscId, licenseInfo, vehicleDescription));
    autoMobileCount++;
  }
  
  
      function getAllAutomobiles() public view returns (AllAutomobiles[] memory) {
        return cars;
    }
    
    
    function removeAutomobiles(uint index) public {
        if (index >= cars.length) return revert('Automobile does not exist!');

        if (index == cars[index].carId) {
          delete cars[index];
          autoMobileCount--;
        } 
  }
