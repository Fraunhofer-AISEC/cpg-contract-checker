    function enRouteList(uint rideNumber) public view returns (address[] memory, uint256) {
        Ride storage curRide = rides[rideNumber];

        address[] memory addressesEnRoute = new address[](curRide.passengerAccts.length);

        uint256 count = 0;
        for (uint256 i = 0; i < curRide.passengerAccts.length; i++) {
            if (keccak256(bytes(curRide.passengers[curRide.passengerAccts[i]].state)) == keccak256("enRoute")) {
                addressesEnRoute[count] = curRide.passengerAccts[i];
                count += 1;
            }
        }

        return (addressesEnRoute, count);
    }
