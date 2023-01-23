pragma solidity ^0.4.17;

contract Driverfactory{

    struct Driver {
        address contractd;
        address account;
    }

    address[] private deployedDriverContracts;

    mapping(address=>Driver) public drivers;

    function createDriver(string lisenceId,string firstName,string lastName,string vehicle,string vehicleType) public{
        require(msg.sender!=drivers[msg.sender].account);
        address newDriver = new DriverProfile(lisenceId,firstName,lastName,vehicle,vehicleType,msg.sender);
        deployedDriverContracts.push(newDriver);
        Driver  memory newDriver1 = Driver({
            contractd:newDriver,
            account:msg.sender
        });
        drivers[msg.sender] = newDriver1;
    }

    function getDeployedDriverContracts() public view returns(address[]){
        return deployedDriverContracts; 
    }

    function checkDriver(address driver) public view returns(bool){
        if(driver==drivers[driver].account){
            return true;
        }

        else{
            return false;
        }

    }

    function driverContract(address driver) public view returns(address){
        address dc_adrs =drivers[driver].contractd;
        return dc_adrs;
    }



}



contract DriverProfile{
    struct Driver{
        string lisenceId;
        string firstName ;
        string lastName; 
        address account;
        string vehicle;
        string vehicleType;
        uint totalOffenceAmount;
        uint offenceCount;
        uint pendingPayments;
        mapping(uint=>Fine)  fines;
    }

    Driver public driver;

    constructor(string lisenceId,string firstName,string lastName,string vehicle,string vehicleType,address owner) public{
        driver = Driver({
            lisenceId:lisenceId,
            lastName:lastName,
            firstName:firstName,
            account:owner,
            vehicle:vehicle,
            vehicleType:vehicleType,
            totalOffenceAmount:0,
            offenceCount:0,
            pendingPayments:0
        });
    }





}
