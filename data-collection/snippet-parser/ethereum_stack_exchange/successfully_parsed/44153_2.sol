function returnClaimedCoins(address _claiment, string _hash) public {
    
    require(msg.sender == _claiment);
    
    require(Refundtracker[msg.sender][_hash].claimed == false);
    
    uint _claimCreatedTime = Refundtracker[msg.sender][_hash].date;

    uint _currentBlockNumber = block.number;

    require(_claimCreatedTime <= (_currentBlockNumber + ClaimTime));

    uint _amountToSend;
    _amountToSend = Refundtracker[msg.sender][_hash].amount;
    Refundtracker[msg.sender][_hash].claimed = true;
    msg.sender.transfer(_amountToSend);
}


function getClaimTimes() view public returns(uint,uint){
    return(ClaimTime, ClaimCheckTime);

}
function setClaimTimes(uint _claimtime, uint _claimchecktime) onlyOwner public  {
    
    require(StartUp == 1);

    
    ClaimTime = _claimtime;
    ClaimCheckTime = _claimchecktime;

    
    StartUp = 0;
    
}

function areWeInSetup() view public returns(uint){
   return(StartUp);
}

function withdrawDonation(address _withdrawlAddress, uint _amount) onlyOwner public returns(bool){
    
    _withdrawlAddress.transfer(_amount);
}

function makeDonation() public payable{
    Donations += msg.value;
}

function checkDonationBalance() view public returns(uint){
    return(Donations);
}

function checkContractBalance() view public returns(uint){
    return(address(this).balance);
}

function setLastCheckedTime(address _address) public {
    LastChecked[_address] = now;
}

function getNumberofClaims(string _name) view public returns (uint){
    return(numberOfClaims[_name]);
}

function getDetails(string _name, uint _claimnumber) view public returns (string){

    string memory _details = detailsOfClaim[_name][_claimnumber];
    return(_details);
}
