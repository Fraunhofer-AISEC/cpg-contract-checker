

pragma experimental ABIEncoderV2;
import "https://github.com/bokkypoobah/BokkyPooBahsDateTimeLibrary/blob/master/contracts/BokkyPooBahsDateTimeLibrary.sol";

contract newPolice {
    using BokkyPooBahsDateTimeLibrary for uint; 
    
    struct userDriver {
        string name;
        uint yearStartedDriving;
        uint accidentsCount;
        uint unpayedFines;
        uint insurance;
        uint driverBalance;
        address driverAddress;
    }
    struct vehicle {
        string vehicleCategory;
        uint price;
        uint periodOfUse;
        bool vehicleRegistrated;
        address driverAddress;
    }
    struct driverId {
        uint driverIdNumber;
        uint driverIdExpireDate;
        string vehicleCategory;
        address driverAddress;
    }
    struct time {
        uint fineTime;
    }
    
    mapping (address => userDriver) private userDriverMapping;
    mapping (address => driverId) private driverIdMapping;
    mapping (uint => driverId) private uintDriverIdMapping;
    mapping (address => vehicle) private vehicleRegistrationRequestMapping;
    mapping (address => time) private fineTimeMapping;
    
    address payable bank = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    
    function driverAddData(string memory _name, uint _yearStartedDriving, uint _accidentsCount, uint _unpayedFines, uint _insurance) public {
        userDriverMapping[msg.sender] = userDriver(_name, _yearStartedDriving, _accidentsCount, _unpayedFines, _insurance, (msg.sender).balance, msg.sender);
    }
    
    function driverAddIdData(uint _driverIdNumber, uint _year, uint _month, uint _day, string memory _driverIdVehicleCategory) public {
        if (msg.sender == userDriverMapping[msg.sender].driverAddress) {
            driverIdMapping[msg.sender] = driverId(_driverIdNumber, BokkyPooBahsDateTimeLibrary.timestampFromDate(_year, _month, _day), _driverIdVehicleCategory, msg.sender);
            uintDriverIdMapping[_driverIdNumber] = driverId(_driverIdNumber, BokkyPooBahsDateTimeLibrary.timestampFromDate(_year, _month, _day), _driverIdVehicleCategory, msg.sender);
        }
    }
    
    function driverVehicalRegistrationRequest(string memory _vehicleCategory, uint _price, uint _periodOfUse) public {
        if ((msg.sender == userDriverMapping[msg.sender].driverAddress) && (keccak256(abi.encode(_vehicleCategory)) == keccak256(abi.encode(driverIdMapping[msg.sender].vehicleCategory)))) {
            vehicleRegistrationRequestMapping[msg.sender] = vehicle(_vehicleCategory, _price, _periodOfUse, true, msg.sender);
        }
    }

    function driverIdTimeExtension(uint _year, uint _month, uint _day) public payable returns(string memory) {
        if (((block.timestamp < (driverIdMapping[msg.sender].driverIdExpireDate) - (4 weeks))) && (userDriverMapping[msg.sender].unpayedFines == 0)) {
            driverIdMapping[msg.sender].driverIdExpireDate = ((BokkyPooBahsDateTimeLibrary.timestampFromDate(_year, _month, _day) - block.timestamp) + (BokkyPooBahsDateTimeLibrary.timestampFromDate(_year, _month, _day)));
        } else {
            return 'No';
        }
    }
    
    function addFine(uint _driverIdNumber) public {
        if (_driverIdNumber == uintDriverIdMapping[_driverIdNumber].driverIdNumber){
            ++userDriverMapping[uintDriverIdMapping[_driverIdNumber].driverAddress].unpayedFines;
            fineTimeMapping[msg.sender].fineTime = block.timestamp;
        }
    }
    
    uint transferMoney = 10 ether;
    function payFine() public payable {
        if (((fineTimeMapping[msg.sender].fineTime - 25) > block.timestamp) && (userDriverMapping[msg.sender].unpayedFines != 0)){
            bank.transfer(transferMoney);
            --userDriverMapping[msg.sender].unpayedFines;
        } else if (userDriverMapping[msg.sender].unpayedFines != 0){
            --userDriverMapping[msg.sender].unpayedFines;
        }
    }
}
