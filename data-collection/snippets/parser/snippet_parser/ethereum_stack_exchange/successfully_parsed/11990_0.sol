contract CarRentalServiceCustomer is GeneralAccount{
    string public customerName;
    string public postalAddress;
    string public phoneNumber;
    string public emailAddress;

    mapping(address=>CarRentService) public rentCar;

    struct CarRentService{ 
        bool active;
        uint lastUpdate;
        uint registrationFee;   
        uint rent;              
    }

    function CarRentalServiceCustomer(string _name,string _postalAddress,string _phoneNumber,string _emailAddress){
        customerName  = _name;
        postalAddress = _postalAddress;
        phoneNumber   = _phoneNumber;
        emailAddress  = _emailAddress;
    }

    function registerToCarRentalServiceProvider(address _providerAddress) onlyOwner {

        rentCar[_providerAddress] = CarRentService({
                                    active: true, 
                                    lastUpdate: now,
                                    registrationFee: 0,
                                    rent: 0
                                    });
    }

    function setRegistrationFee(uint _registrationFee) {
        if(rentCar[msg.sender].active){
            rentCar[msg.sender].lastUpdate      = now;
            rentCar[msg.sender].registrationFee = _registrationFee;
        }
        else{
            throw;
        }
    }

    function setCarRent(uint _rent) {
        if(rentCar[msg.sender].active){
            rentCar[msg.sender].lastUpdate = now;
            rentCar[msg.sender].rent       = _rent;
        }
        else{
            throw;
        }
    }

    function payRegistrationFeeToCarRentalServiceProvider(address _providerAddress) returns (bool){

        bool regFeeStatus = true;
        if(_providerAddress.send(rentCar[_providerAddress].registrationFee))
        {
            rentCar[_providerAddress].registrationFee = 0;
            return regFeeStatus;
        }
        else{
            return !regFeeStatus;
        }
    }

    function payRentToCarRentalServiceProvider(address _providerAddress) returns (bool){

        bool payStatus = true;
        if(_providerAddress.send(rentCar[_providerAddress].rent))
        {
            rentCar[_providerAddress].rent = 0;
            return payStatus;
        }
        else{
            return !payStatus;
        }
    }

    function unsubscribeFromCarRentalService(address _providerAddress){
        if(rentCar[_providerAddress].active = false && rentCar[_providerAddress].rent == 0 
        && rentCar[_providerAddress].registrationFee == 0 ){
            rentCar[_providerAddress].active = false;
        } else {
            throw;
        }
    }
}
