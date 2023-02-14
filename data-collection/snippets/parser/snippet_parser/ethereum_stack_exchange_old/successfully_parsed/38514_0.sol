function distribute(
    uint _airDropID
) public
{
    for (uint i = 0; i < airDrops[_airDropID].participantCount; i++) {
        TokenDrop(msg.sender, airDrops[_airDropID].participants[i], airDrops[_airDropID].amount);

        ERC20(token).transfer(airDrops[_airDropID].participants[i], airDrops[_airDropID].amount);

        
    }
}
