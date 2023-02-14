    function registerDriver(uint _perkm) public payable returns(string memory) {
           require(Drivers[msg.sender] == 0,"You are already registered as 
    Driver.");
            driverCount++;
            driverList.push(Driver({
                driverID : driverCount,
            driverAddr : msg.sender,
            rideID : 0,
            perkm : _perkm,
            currentStatus : available,
            bids: 0

        }));
        Drivers[msg.sender] = driverCount;
        return "You are registered as Driver.";
    }
