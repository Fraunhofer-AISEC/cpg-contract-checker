

pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract CrowdfundingCampaign {
    using SafeERC20 for ERC20;

    
    ERC20 public token;

    
    address payable public owner;

    
    uint256 public fundingGoal;

    
    uint256 public totalFundsPledged;

    
    mapping(address => uint256) public fundsPledged;

    
    event FundPledged(address indexed _from, uint256 _amount);
    event RefundClaimed(address indexed _to, uint256 _amount);

    constructor(ERC20 _token, uint256 _fundingGoal) {
        require(
            _token.totalSupply() > 0,
            "Token contract must have a positive total supply"
        );
        require(_fundingGoal > 0, "Funding goal must be a positive value");

        token = _token;
        owner = payable(msg.sender);
        fundingGoal = _fundingGoal;
    }

    
    function pledgeFunds(uint256 _amount) public payable {
        require(_amount > 0, "Pledge amount must be a positive value");
        require(
            token.transferFrom(msg.sender, address(this), _amount),
            "Token transfer failed"
        );

        fundsPledged[msg.sender] += _amount;
        totalFundsPledged += _amount;

        emit FundPledged(msg.sender, _amount);
    }

    
    function claimRefund() public {
        require(
            totalFundsPledged < fundingGoal,
            "Funding goal has been met, no refunds available"
        );
        require(fundsPledged[msg.sender] > 0, "You have not pledged any funds");

        uint256 refundAmount = fundsPledged[msg.sender];
        token.safeTransfer(msg.sender, refundAmount);

        fundsPledged[msg.sender] = 0;
        totalFundsPledged -= refundAmount;

        emit RefundClaimed(msg.sender, refundAmount);
    }

    
    function endCampaign() public {
        require(
            msg.sender == owner,
            "Only the contract owner can end the campaign"
        );
        require(
            totalFundsPledged >= fundingGoal,
            "Funding goal has not been met"
        );

        
        

        token.safeTransfer(owner, address(this).balance);

        
    }
}
