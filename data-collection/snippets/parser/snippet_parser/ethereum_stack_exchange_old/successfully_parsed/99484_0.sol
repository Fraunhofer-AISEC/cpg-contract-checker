pragma solidity ^0.5.0;


import "./BlahToken.sol";

contract TokenFarm {
    string public name = "Blah Token Farm";
    address public owner;
    BlahToken public blahToken;


address[] public stakers;
mapping(address => uint) public stakingBalance;
mapping(address => bool) public hasStaked;
mapping(address => bool) public isStaking;

constructor(BlahToken _blahToken) public {
    blahToken = _blahToken;
    owner = msg.sender;
}

function stakeTokens(uint _amount) public {
    
    require(_amount > 0, "amount cannot be 0");

    
    blahToken.transferFrom(msg.sender, address(this), _amount);

    
    stakingBalance[msg.sender] = stakingBalance[msg.sender] + _amount;

    
    if(!hasStaked[msg.sender]) {
        stakers.push(msg.sender);
    }

    
    isStaking[msg.sender] = true;
    hasStaked[msg.sender] = true;
}


function unstakeTokens() public {
    
    uint balance = stakingBalance[msg.sender];

    
    require(balance > 0, "staking balance cannot be 0");

    
    blahToken.transfer(msg.sender, balance);

    
    stakingBalance[msg.sender] = 0;

    
    isStaking[msg.sender] = false;
}


function issueTokens() public {
    
    require(msg.sender == owner, "caller must be the owner");

    
    for (uint i=0; i<stakers.length; i++) {
        address recipient = stakers[i];
        uint balance = stakingBalance[recipient];
        if(balance > 0) {
            blahToken.transfer(recipient, balance);
        }
    }
}
}
