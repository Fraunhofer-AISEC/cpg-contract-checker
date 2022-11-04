contract DriverProfile{
    address watch_adrs=0x0971b5d216af52c411c9016bbc63665b4e6f2542;

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




    TrafficFine trafficfine;
    Driver public driver;

    constructor(string lisenceId,string firstName,string lastName,string vehicle,string vehicleType,address owner) public{
        trafficfine = TrafficFine(watch_adrs);
        trafficfine.addDriver();
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




     function doFine(uint offenceID,string location,address officer) public {
        address officersel=trafficfine.getOfficer(officer);
        require(officer==officersel);
        driver.offenceCount++;
     }

}

    contract TrafficFine{
        function addOfficer(string firstName,string lastName,address officer) public;
        function getOfficer(address officer) public view returns (address);

    }
