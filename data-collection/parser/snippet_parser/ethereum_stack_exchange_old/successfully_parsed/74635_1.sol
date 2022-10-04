    function enRouteList(uint rideNumber) public view returns (address[] memory) {
        Ride storage curRide = rides[rideNumber];
        uint256 count = 0;
        for (uint256 i = 0; i < curRide.passengerAccts.length; i++) {
            if (keccak256(bytes(curRide.passengers[curRide.passengerAccts[i]].state)) == keccak256("enRoute")) {
                count += 1;
            }
        }
        address[] memory addressesEnRoute = new address[](count);
        uint256 index = 0;
        for (uint256 i = 0; i < curRide.passengerAccts.length; i++) {
            if (keccak256(bytes(curRide.passengers[curRide.passengerAccts[i]].state)) == keccak256("enRoute")) {
                addressesEnRoute[index] = curRide.passengerAccts[i];
                index += 1;
            }
        }
    }
