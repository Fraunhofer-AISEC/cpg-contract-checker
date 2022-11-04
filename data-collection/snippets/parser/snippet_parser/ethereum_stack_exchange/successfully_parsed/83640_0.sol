    function _registerAirline(address addr, string memory name)
        external
        requireIsOperational
    {
        require(!airlines[addr].isRegistered, "Airline is already registered");

        airlines[addr] = Airline({
            name: name,
            isFunded: false,
            isRegistered: true
        });

        multiSig.push(addr);
        emit AirlineRegistered(
            airlines[addr].name,
            airlines[addr].isFunded,
            airlines[addr].isRegistered
        );
    }

