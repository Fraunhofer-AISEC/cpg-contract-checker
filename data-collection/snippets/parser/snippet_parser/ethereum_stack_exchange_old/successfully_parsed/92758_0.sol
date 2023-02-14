function checkVehicleExists (string memory _registrationNo) public view returns (bool) {
        bool vehicleExists = false;
        if (bytes(vehicleList[_registrationNo].vehicleRegistrationNo).length =! 0) {
            vehicleExists = true;
        }
        return (vehicleExists);
    }
