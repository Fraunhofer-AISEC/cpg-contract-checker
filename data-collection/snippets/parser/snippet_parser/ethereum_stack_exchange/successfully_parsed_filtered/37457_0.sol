pragma solidity ^0.4.18;

contract rentCar {

    struct Renter {
        address  addr;
        uint DOB;
        uint currentRenting;
    }

    bool public rented;
    address public owner;
    uint public duration;
    uint public rentalPrice;
    uint public charge;
    uint public rentalDate;
    uint public returnDate;
    uint public rentalStartDate;
    uint public rentalEndDate;
    uint public constant totalDays = 7;


    struct NameKey{ 
        uint[] keys;
    }

    
    uint[] private ids;  
    uint public numofCars;
    mapping(uint => Car) private cars;
    mapping(string => NameKey) private nameToKeys;

    
    event E_addCar(uint objID, address VechileOwner);
    event E_Rent(address indexed _renter, uint _rentalDate, uint _returnDate, uint _rentalPrice);
    event E_ReturnRental(address indexed _renter, uint _returnDate);

    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    modifier whenNotRented() {
        require(!rented);
        _;
    }

    modifier whenRented() {
        require(rented);
        _;
    }

    

    function rentCar() public{
        owner = msg.sender;
    }

    function addCar(string make, string model, uint pricePerDay, uint minRentalDay, uint maxRentalDay, bool available) public onlyOwner {

        Car newCar = cars[numofCars];
        
        
        newCar.VechileOwner = msg.sender;
        newCar.make = make;
        newCar.model = model;
        newCar.available = available;
        newCar.pricePerDay = pricePerDay;
        newCar.minRentalDay = minRentalDay;
        newCar.maxRentalDay = maxRentalDay;

        newCar(numofCars,msg.sender);
        ids.push(numofCars);
        numofCars++;

    }

    function setAvailable(uint objID, bool _available) public view onlyOwner {
        
        cars[objID].available = _available;
    }

    

    function Rent(uint objID,uint totalDays) public payable  whenNotRented returns(bool){
        
        require (msg.value < cars[objID].deposit);
        require(totalDays >= cars[objID].minRentalDay && totalDays <= cars[objID].maxRentalDay);


        cars[objID].renter = Renter({addr:msg.sender, currentRenting:now});

        uint PayDeposit = msg.value - cars[objID].deposit;
        rentalPrice = totalDays *  cars[objID].pricePerDay;
        rentalDate = rentalStartDate;
        returnDate = rentalEndDate;

        cars[objID].available = false;
        rented = true;

        

        
        E_Rent(Renter, rentalDate, returnDate, rentalPrice);

        return true;
    }

    function endRent (uint objID, uint duration) public  whenRented {
        
        duration = (now - cars[objID].renter.currentRenting) / (24*60*60*1.0);
        charge = duration * cars[objID].priceDaily - cars[objID].deposit;
        uint totalPayment = msg.value - charge;

        require(!cars[objID].VechileOwner.send(charge));
        require(!cars[objID].renter.addr.send(charge));

        delete cars[objID].renter;
        cars[objID].available = false;

        E_ReturnRental(Renter, now);

        resetRental();
    }

    function forceRentalEnd() public onlyOwner{
        require(now > returnDate && rented);

        E_ReturnRental(Renter, now);

        resetRental();
    }

    function resetRental() private{
        rented = false;
        Renter.addr = address(0);
        rentalDate = 0;
        returnDate = 0;
    }
}
