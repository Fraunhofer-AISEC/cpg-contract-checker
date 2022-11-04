
function deposit(Store storage self) public {
    require(msg.value > 0);
    address user = msg.sender;
    
    if(self.contributor[user].ether_in<=0)
        self.numContributors++;
    self.contributor[user].ether_in += msg.value;
    self.ether_in += msg.value;
}

function withdraw(Store storage self) internal {
    address user = msg.sender;
    require(self.contributor[user].ether_in>0);
    ether_out = self.contributor[user].ether_in;
    self.numContributors--;
    user.transfer(ether_out);
    self.contributor[user].ether_in = 0
}
