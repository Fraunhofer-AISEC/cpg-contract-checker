modifier requireRegisteredAirlines()
{
    require(flightSuretyData.checkAirlineRegistered(msg.sender) == true, "Caller is not registered Airline");                                       
    _;
}
