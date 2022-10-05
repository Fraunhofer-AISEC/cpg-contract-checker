pragma solidity ^0.4.18;

interface token {
    function transfer(address receiver, uint amount) external;
}

contract Crowdsale {
    address public beneficiary;
    uint public amountRaised;
    uint public price;
    token public tokenReward;
    mapping(address => uint256) public balanceOf;

    event FundTransfer(address backer, uint amount, bool isContribution);

    
    constructor(
        address ifSuccessfulSendTo,
        uint milietherCostOfEachToken,
        address addressOfTokenUsedAsReward
    ) public {
        beneficiary = ifSuccessfulSendTo;
        price = milietherCostOfEachToken * 0.0001 ether;
        tokenReward = token(addressOfTokenUsedAsReward);
    }

    function () payable public {

        uint amount = msg.value;
        balanceOf[msg.sender] += amount;
        amountRaised += amount;
        tokenReward.transfer(msg.sender, amount * 10**18 / price);
        emit FundTransfer(msg.sender, amount, true);

        
        beneficiary.transfer(amount);
    }
}
