contract FlightSuretyData {
    using SafeMath for uint256;
    uint256 fundedAirlineCount = 0;
    mapping(address => Airline) public airlines;

    event AirlineFunding(address airline);


    function fundAirline(address airline, uint256 amount) 
        external
        requireIsOperational
        requireAirlineIsRegistered(airline)
    {
        airlines[airline].isFunded = true;
        airlines[airline].funds = airlines[airline].funds.add(amount);
        fundedAirlineCount += 1;
        emit AirlineFunding(airline);
    }

    receive() external payable {}
    fallback() external payable {}
}

interface FlightSuretyData {
    function fundAirline(address airline, uint256 amount) external;
}

contract FlightSuretyApp {
    FlightSuretyData flightSuretyData;
    uint256 AIRLINE_REGISTRATION_FEE = 5 ether;

    function fundAirline() 
        external 
        payable 
        requireIsOperational
        requireHasSufficientFunds(AIRLINE_REGISTRATION_FEE)
    {
        if (flightSuretyData.getAirlineIsRegistered(msg.sender)) {
            payable(address(flightSuretyData)).transfer(msg.value);
            flightSuretyData.fundAirline(msg.sender, msg.value);
        }
    }
}

