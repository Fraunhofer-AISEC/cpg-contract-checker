function checkExpAmount(address _addr) public view returns (bytes4) {
    return bytes4(players_data[_addr].playerData << 28*8);
}
