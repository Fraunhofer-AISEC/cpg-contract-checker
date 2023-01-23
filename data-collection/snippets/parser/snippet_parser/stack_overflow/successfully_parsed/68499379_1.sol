function transferEther(address payable rec, uint _amount) public payable {
    rec.transfer(_amount);
}
