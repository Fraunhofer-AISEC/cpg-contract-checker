function getPayment() public view returns (address[] memory, uint[] memory){
    address[] memory addresses = new address[](maxwave[msg.sender].length);
    uint[] memory noOfWaves = new uint[](maxwave[msg.sender].length);
    for(uint i=0;i<maxwave[msg.sender].length;i++){
        addresses[i] = maxwave[msg.sender][i].userAddress;
        noOfWaves[i] = maxwave[msg.sender][i].noOfWave;
    }
    return (addresses, noOfWaves);
}
