function contribute()
    public 
    inState(State.Fundraising)
    isMinimum()
    iinMultipleOfPrice() payable returns (uint256){

        uint256 amountInWei = msg.value;

        contributions.push(
            Contribution({amount: msg.value, contributor: msg.sender})
            );
        totalRaised += msg.value;
        currentBalance = totalRaised;
        if(fundingMaximumTargetInwei !=0){
            tokenReward.transfer(msg.sender, amountInWei/priceInWei);

        } else {
            tokenReward.mintToken(msg.sender, amountInWei/priceInWei);

        }   

        (LogFundingSuccessful(msg.sender, msg.value, totalRaised)

        

        return contributions.length - 1;
    }
