0x01000000000000000000000000000000000000000000000000000000ffffffff

function checkExpAmount(address _addr) public view returns (bytes4) {
    return players_data[_addr].playerData[28];
}
