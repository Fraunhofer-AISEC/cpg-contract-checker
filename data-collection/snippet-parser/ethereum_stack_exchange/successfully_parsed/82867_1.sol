function bookTrip(uint256 key) external payable requireTrip(key) nonBookedPassenger(key){
        Trip storage trip = trips[key];
        trip.passengers[msg.sender] = trip.price;
        trip.passengerCount++;
        emit LogNewTripPassenger(msg.sender, key, trip.price);
    }
