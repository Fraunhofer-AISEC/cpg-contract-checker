contract TripHistory {
    mapping(string => int32[]) trips;

    function getTrip(string _trip_id) public view returns (int32[]) {
        return trips[_trip_id];
    }
    function storeTrip(string _trip_id, int16 _lat, int16 _lon) public {
       trips[_trip_id].push((int32(_lat) << 16) | int32(_lon));
    }
}
