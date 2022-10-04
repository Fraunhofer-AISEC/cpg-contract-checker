contract TripHistory {
       struct Trip {
           string lat;
           string lon;
       }
        mapping(string => Trip[]) trips;

        function getTrip(string _trip_id) public view returns (Trip[]) {
            return trips[_trip_id];
        }
        function storeTrip(string _trip_id, string _lat, string _lon) public  {
           trips[_trip_id].push(Trip(_lat, _lon));
        }

}
