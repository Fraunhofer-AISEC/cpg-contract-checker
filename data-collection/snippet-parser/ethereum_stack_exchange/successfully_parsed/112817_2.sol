function checkExpAmount(address _addr) public view returns (bytes4) {
    bytes1 first = players_data[_addr].playerData[28];
    bytes1 second = players_data[_addr].playerData[29];
    bytes1 third = players_data[_addr].playerData[30];
    bytes1 fourth = players_data[_addr].playerData[31];
    return bytes4(abi.encodePacked(first, second, third, fourth));
}
