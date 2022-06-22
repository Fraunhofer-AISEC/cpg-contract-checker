contract  Car is rentCar {
    address public VechileOwner;
    string public make;
    string public model;
    Renter public renter;

    bool public available;
    uint public pricePerDay;
    uint public deposit;
    uint public entrycode;
    uint public minRentalDay;
    uint public maxRentalDay;

    function checkAvailability() public view returns (bool) {
        return(Car.available);
    }

    function Car(string _make, string _model, uint _pricePerDay, uint _minRentalDay, uint _maxRentalDay, bool _available) public onlyOwner{
        make = _make;
        model = _model;
        pricePerDay = _pricePerDay;
        minRentalDay = _minRentalDay;
        maxRentalDay = _maxRentalDay;
        available = _available;
    }  
}
