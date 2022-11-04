
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";

import "./tokenERC.sol";

contract APYStaking is Ownable{
    string public name = "APY Staking";
    tokenERC public APY;

 
    

    
    uint256 public dailyAPY = 300;

    
    uint256 public dailyAPY60 = 300;

    
    uint256 public dailyAPY90 = 300;

    
    uint256 public totalStaked;
    uint256 public customTotalStaked;

    
    mapping(address => uint256) public stakingBalance;
    mapping(address => uint256) public customStakingBalance;

    
    mapping(address => bool) public hasStaked;
    mapping(address => bool) public customHasStaked;

    
    mapping(address => bool) public isStakingAtm;
    mapping(address => bool) public customIsStakingAtm;

    
    address[] public stakers;
    address[] public customStakers;

    constructor(TechAlchemy _APY) public{
        APY = _APY;
    }

    

    function stakeTokens(uint256 _amount) public {
        
        require(_amount > 0, "amount cannot be 0");

        
        APY.transferFrom(msg.sender, address(this), _amount);
        totalStaked = totalStaked + _amount;

        
        stakingBalance[msg.sender] = stakingBalance[msg.sender] + _amount;

        
        if (!hasStaked[msg.sender]) {
            stakers.push(msg.sender);
        }

        
        hasStaked[msg.sender] = true;
        isStakingAtm[msg.sender] = true;
    }

    

    function unstakeTokens() public {
        

        uint256 balance = stakingBalance[msg.sender];

        
        require(balance > 0, "amount has to be more than 0");

        
        APY.transfer(msg.sender, balance);
        totalStaked = totalStaked - balance;

        
        stakingBalance[msg.sender] = 0;

        
        isStakingAtm[msg.sender] = false;
    }

    
    function customStaking60(uint256 _amount) public {
        require(_amount > 0, "amount cannot be 0");
        APY.transferFrom(msg.sender, address(this), _amount);
        customTotalStaked = customTotalStaked + _amount;
        customStakingBalance[msg.sender] =
            customStakingBalance[msg.sender] +
            _amount;

        if (!customHasStaked[msg.sender]) {
            customStakers.push(msg.sender);
        }
        customHasStaked[msg.sender] = true;
        customIsStakingAtm[msg.sender] = true;
    }

    function customUnstake60() public {
        uint256 balance = customStakingBalance[msg.sender];
        require(balance > 0, "amount has to be more than 0");
        APY.transfer(msg.sender, balance);
        customTotalStaked = customTotalStaked - balance;
        customStakingBalance[msg.sender] = 0;
        customIsStakingAtm[msg.sender] = false;
    }

    
    function customStaking90(uint256 _amount) public {
        require(_amount > 0, "amount cannot be 0");
        APY.transferFrom(msg.sender, address(this), _amount);
        customTotalStaked = customTotalStaked + _amount;
        customStakingBalance[msg.sender] =
            customStakingBalance[msg.sender] +
            _amount;

        if (!customHasStaked[msg.sender]) {
            customStakers.push(msg.sender);
        }
        customHasStaked[msg.sender] = true;
        customIsStakingAtm[msg.sender] = true;
    }

    function customUnstake90() public {
        uint256 balance = customStakingBalance[msg.sender];
        require(balance > 0, "amount has to be more than 0");
        APY.transfer(msg.sender, balance);
        customTotalStaked = customTotalStaked - balance;
        customStakingBalance[msg.sender] = 0;
        customIsStakingAtm[msg.sender] = false;
    }

    
    function redistributeRewards() public onlyOwner{
       
        
        for (uint256 i = 0; i < stakers.length; i++) {
            address recipient = stakers[i];

            
            uint256 balance = stakingBalance[recipient] * dailyAPY;
            balance = balance / 100000;

            if (balance > 0) {
                APY.transfer(recipient, balance);
            }
        }
    }

    
    function customRewards60() public onlyOwner{
     
        for (uint256 i = 0; i < customStakers.length; i++) {
            address recipient = customStakers[i];
            uint256 balance = customStakingBalance[recipient] * dailyAPY60;
            balance = balance / 100000;

            if (balance > 0) {
                APY.transfer(recipient, balance);
            }
        }
    }

    
    function customRewards90() public onlyOwner{
     
        for (uint256 i = 0; i < customStakers.length; i++) {
            address recipient = customStakers[i];
            uint256 balance = customStakingBalance[recipient] * dailyAPY90;
            balance = balance / 100000;

            if (balance > 0) {
                APY.transfer(recipient, balance);
            }
        }
    }

    
    function changeAPY60(uint256 _value) public onlyOwner {
       
        require(
            _value > 0,
            "APY value has to be more than 0, try 300 for (0.3% daily) instead"
        );
        dailyAPY60= _value;
    }

    
    function changeAPY90(uint256 _value) public onlyOwner {
       
        require(
            _value > 0,
            "APY value has to be more than 0, try 300 for (0.3% daily) instead"
        );
        dailyAPY90 = _value;
    }

    
    function claimTst() public {
        address recipient = msg.sender;
        uint256 testingtoken = 1000000000000000000000;
        uint256 balance = testingtoken;
        APY.transfer(recipient, balance);
    }
}
