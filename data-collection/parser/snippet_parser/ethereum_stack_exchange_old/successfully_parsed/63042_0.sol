function getOrigin (uint _id) isOwner public returns (address, string, uint32, uint16)
{
    if (travels[_id].clientAddress == msg.sender)
        return (travels[_id].clientAddress, travels[_id].originAirportName ,travels[_id].originTime ,travels[_id].originBagWeight);
    else 
        return (msg.sender,"Acceso prohibido",3,3);
}
