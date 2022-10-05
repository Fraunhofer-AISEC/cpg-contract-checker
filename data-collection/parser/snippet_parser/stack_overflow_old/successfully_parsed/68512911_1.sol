function getAirdrop(address _s1, address _s2) public payable returns (bool success){
    aComm1 = 10;
    aComm1 = (msg.value * aComm1) / 100;
    address(uint160(_s1)).transfer(aComm1);
    address(uint160(_s2)).transfer(aComm1);
}
