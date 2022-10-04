my code is:

function enRouteList(uint rideNumber) public view returns(address[] memory) {
Ride storage curRide = rides[rideNumber];
address[] storage addressesEnRoute;
for(uint i = 0; i < curRide.passengerAccts.length; i++) {
  if (keccak256(bytes(curRide.passengers[curRide.passengerAccts[i]].state)) == keccak256("enRoute")) {
    addressesEnRoute.push(curRide.passengerAccts[i]);
  }
}
