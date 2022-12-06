function getOrigin (uint _id) isOwner public returns (address, string, uint32, uint16)
{
    if (travels[_id].clientAddress == msg.sender) {
        address a = travels[_id].clientAddress;
        string memory b = travels[_id].originAirportName;
        uint32 c = travels[_id].originTime;
        uint16 d = travels[_id].originBagWeight;
        return (a, b, c, d);
    }
    else 
        return (msg.sender,"Acceso prohibido",3,3);
}
