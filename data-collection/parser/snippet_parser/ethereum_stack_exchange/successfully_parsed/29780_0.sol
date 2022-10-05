pragma solidity ^0.4.16;

interface token {
    function mintToken(address receiver, uint amount);
}

contract Owned {

    address owner;

    
    function owned() { owner = msg.sender; }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}

contract Selfdestroy is Owned {

    
    function Destroy() onlyOwner() {
        selfdestruct(owner);
    }

}


contract Crowdsale is Owned,Selfdestroy {
    address public beneficiary;
    uint public fundingGoal;
    uint public amountRaised;
    uint public deadline;
    uint public price;
    token public tokenReward;
    mapping(address => uint256) public balanceOf;
    bool crowdsaleClosed = false;

    event GoalReached(address recipient, uint totalAmountRaised);
    event FundTransfer(address backer, uint amount, bool isContribution);

    
    function Crowdsale(
        address ifSuccessfulSendTo,
        uint fundingGoalInEthers,
        uint durationInMinutes,
        uint etherCostOfEachToken,
        address addressOfTokenUsedAsReward
    ) {
        beneficiary = ifSuccessfulSendTo;
        fundingGoal = fundingGoalInEthers * 1 ether;
        deadline = now + durationInMinutes * 1 minutes;
        price = etherCostOfEachToken;
        tokenReward = token(addressOfTokenUsedAsReward);
    }

    
    function () payable {  
        uint amount = msg.value;
        balanceOf[msg.sender] += amount;
        amountRaised += amount;
        tokenReward.mintToken(msg.sender, amount / price);
        FundTransfer(msg.sender, amount, true);
    }

    
    function OwnerWithdrawal() onlyOwner {
     beneficiary.transfer(amountRaised);
    }

}
