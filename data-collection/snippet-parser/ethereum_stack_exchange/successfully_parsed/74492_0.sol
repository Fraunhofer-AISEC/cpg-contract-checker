function airdrop(uint val) public payable {
    require(airdrop == true);
    if (val == 0x31){
        msg.sender.transfer(1 ether);    
        airdrop = false;
    }        
}
