contract RentalCompleting{

struct Rental {
    uint256 stratingDate;
    uint256 endingDate;
    uint256 maxRentalDuration;
    uint256 drivingLicenseExpirationDay;
    uint256 depositAmount;
    string car;
    uint256 invoiceAmount;
    }

Rental public rental;

constructor() public{
    initiator = 0xf1055613923229f387780bC5bC92CEB8DbCEFE07; 
    executor = msg.sender; 
    
    rental.maxRentalDuration = 10000000;
    rental.depositAmount=0;
    rental.invoiceAmount=0;
}


DepositPaying public depositPaying;

function returnsRental(address _address) public view returns (Rental memory){
    return Rental(rental.stratingDate, 
           rental.endingDate, 
           rental.maxRentalDuration, 
           rental.drivingLicenseExpirationDay, 
           rental.depositAmount,
           rental.car,
           rental.invoiceAmount);
}

function requestRentalCompleting(uint256 _startingDate, uint256 _endingDate, uint256 _drivingLicenseExpirationDay) public{
            
             require(_endingDate >= _startingDate);
             require((_endingDate - _startingDate) <= rental.maxRentalDuration);
             require(_drivingLicenseExpirationDay >= _endingDate);
             rental.stratingDate = _startingDate;
             rental.endingDate = _endingDate;
             rental.drivingLicenseExpirationDay = _drivingLicenseExpirationDay;                 
        }
         
function promiseRentalCompleting() public
         returns (address){
             
             depositPaying = new DepositPaying(address(this));                 
             return address(depositPaying);
         }

contract DepositPaying{

RentalCompleting public rentalCompleting;

constructor(address _rentalCompleting) public{
    
    rentalCompleting = RentalCompleting(_rentalCompleting);
    
    initiator = rentalCompleting.executor(); 
    executor = rentalCompleting.initiator(); 
}

function getRental() view public returns (RentalCompleting.Rental memory){
    return rentalCompleting.returnsRental(address(this));
}

uint256 r = getRental().depositAmount;
function requestDepositPaying(uint256 _rq_depositAmount) public
        {
             require(_rq_depositAmount == r);
             c_fact = C_facts.Requested;
         }
