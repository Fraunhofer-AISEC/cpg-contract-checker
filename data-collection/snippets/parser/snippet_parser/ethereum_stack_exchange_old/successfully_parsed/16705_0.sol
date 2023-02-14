function getVehicleDetails(string _vin) returns (string _vln, uint _year, string _make, string _model, string _colour) {
    Vehicle vehicle = vehicles[_vin];
    if (vehicle.year == 0)
        throw;

     _vln = vehicle.vln;
    _year = vehicle.year;
    _make = vehicle.make;
    _model = vehicle.model;
    _colour = vehicle.colour;
}
