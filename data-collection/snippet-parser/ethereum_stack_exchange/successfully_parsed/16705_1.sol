function setVehicleDetails(string _vin, string _vln, uint _year, string _make, string _model, string _colour) owneronly {
    Vehicle vehicle = vehicles[_vin];
    if (vehicle.year == 0)
        throw;
    vehicle.vln = _vln;
    vehicle.year = _year;
    vehicle.make = _make;
    vehicle.model = _model;
    vehicle.colour = _colour;
}
