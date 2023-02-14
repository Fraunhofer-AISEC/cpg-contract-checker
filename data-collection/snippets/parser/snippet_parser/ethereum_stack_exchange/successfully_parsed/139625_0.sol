
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import './Car.sol';

contract CarRentalService {

    address private _rentalServiceAddress;
    address private _rentee;
    uint private _startTime; 
    uint private _endTime;
    uint private _timeElapsed;
    uint private _milageCap;
    uint private _renteesYearsOfExperience;
    uint256 private _tokenId;
    CarToken private _token;
    CarData private _car;
    uint private _monthlyQuota;
    uint256 _CarTokenId;

    enum State {created, agreed, active, finished}
    State public _state;

    enum Option {terminate, extend, newVehicle}
    Option private _option;


    modifier inState(State state) {
        require(state == _state, "Cannot perform the given task in the current state.");
        _;
    }

    modifier checkOwner() {
        require (msg.sender == _rentalServiceAddress, "Only the owner may perform this action.");
        _;
    }

    modifier checkRentee() {
        require (msg.sender == _rentee, "Only the rentee may perform this action.");
        _;
    }

    modifier ensureCorrectLength() {
        require (_timeElapsed == _endTime, "Contract cannot be ended early.");
        _;
    }

    
    modifier monthHasPassed() {
        require (block.timestamp - _timeElapsed > 1, "Payment may only occur once every 30 days");
        _;
    }

    modifier checkCorrectSum() {
        require (msg.value == _monthlyQuota, "Not Correct sum");
        _;
    }


    constructor(address rentee, uint256 renteesYearsOfExperience, uint256 milageCap, uint256 duration, uint256 tokenId, string memory model, string memory color, uint256 milage, uint256 originalValue, uint256 yearOfMatriculation) {
        _rentalServiceAddress = msg.sender;
        _token = new CarToken();
        _rentee = rentee;
        _renteesYearsOfExperience = renteesYearsOfExperience;
        _milageCap = milageCap;
        _startTime = block.timestamp;
        _endTime = block.timestamp + duration;
        _timeElapsed = 0;
        _tokenId = tokenId;
        
        if(_token.exists(tokenId)){
            _car = _token.getCarData(tokenId);
        } else {
            
            _token.mint(model, originalValue, milage, color, yearOfMatriculation);
            _car = _token.getCarData(tokenId);
        } 
        _monthlyQuota = _token.getMonthlyQuota(renteesYearsOfExperience, milageCap, duration, _car.originalValue, _car.milage);
        _state = State.created;
    }

    function setOption(Option option) internal {
        _option = option;
    }


    function agreeLease() public inState(State.created) checkRentee payable {
        
        require(address(_rentee).balance > 5*_monthlyQuota, "You need suficient funds for the coming month in order to enter contract");
        
        require(msg.value == (4 * _monthlyQuota), "Not enough money to enter leasing agreement");
        _state = State.agreed;
    }

    function confirmLease() public inState(State.agreed) checkOwner payable {
        
        (bool sent,) = _rentalServiceAddress.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
        _token.transfer(_tokenId, _rentee);
        _state = State.active;
    }

    function incrementMonth() public inState(State.active) monthHasPassed checkOwner checkCorrectSum payable {
        _timeElapsed = _timeElapsed + 1;
        if (_timeElapsed + _startTime >= _endTime) {
            
            finishLease(0, 0, 0, "", "", 0, 0, 0);
        } else if (_timeElapsed + 1 * 3 >= _endTime ) {
            
        } else {
            
            (bool sent,) = _rentalServiceAddress.call{value: msg.value}("");
            require(sent, "Failed to send Ether");
        }
    }

    function updateContract(
        uint256 tokenId, 
        uint256 milageCap, 
        uint256 duration, 
        string memory model, 
        string memory color, 
        uint256 milage, 
        uint256 originalValue, 
        uint256 yearOfMatriculation
        ) public {
            _milageCap = milageCap;
            _startTime = block.timestamp;
            _endTime = block.timestamp + duration;
            _timeElapsed = 0;
            _tokenId = tokenId;
            if(_token.exists(tokenId)){
                _car = _token.getCarData(tokenId);
            } else {
                _token.mint(model, originalValue, milage, color, yearOfMatriculation);
                _car = _token.getCarData(tokenId);
            } 
            _monthlyQuota = _token.getMonthlyQuota(_renteesYearsOfExperience, milageCap, duration, _car.originalValue, _car.milage);
            _state = State.created;
     }


    function finishLease(
            uint256 tokenIdOfNewCar, 
            uint256 milageCap, 
            uint256 duration, 
            string memory model, 
            string memory color, 
            uint256 milage, 
            uint256 originalValue, 
            uint256 yearOfMatriculation
        ) public inState(State.active) ensureCorrectLength checkOwner payable {
        
        if (tokenIdOfNewCar == 0 && _option == Option.newVehicle) {
            require(false, "Need tokenId of new Car in order to get a new car.");
        }
        _state = State.finished;
        if (_option == Option.terminate) {
            
            _token.transfer(_tokenId, _rentalServiceAddress);
            _state = State.finished;
        } else if (_option == Option.extend) {
            
            uint yearsLeased = _endTime - _startTime / 12;
            _renteesYearsOfExperience = _renteesYearsOfExperience + yearsLeased;
            _startTime = block.timestamp;
            _endTime = block.timestamp + 12;
            _timeElapsed = 0;
            _monthlyQuota = _token.getMonthlyQuota(_renteesYearsOfExperience,  _milageCap, 12,  _car.originalValue, _car.milage);
            require(msg.value == (4 * _monthlyQuota), "Not enough money to enter leasing agreement");
            (bool sent,) = _rentalServiceAddress.call{value: _monthlyQuota * 4}("");
            require(sent, "Failed to send Ether");
            _state = State.active;
        } else if (_option == Option.newVehicle) {
            
            _rentalServiceAddress = msg.sender;
            uint yearsLeased = _endTime - _startTime / 12;
            _renteesYearsOfExperience = _renteesYearsOfExperience + yearsLeased;
            updateContract(_tokenId, milageCap, duration, model, color, milage, originalValue, yearOfMatriculation);
        }
    }
    
 

}
