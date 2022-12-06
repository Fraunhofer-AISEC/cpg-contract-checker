pragma solidity ^0.4.17;


contract TacoSavings {
    
    struct data {
        address client;
        uint256 savings;
        uint256 timeLock;
    }
    mapping(address => data) accountData;

    

    function saveMoney(uint256 _time) public payable {
    
    if (accountData[msg.sender].client != address(0)) {
        
        data storage oldAccountData = accountData[msg.sender];
        oldAccountData.savings = oldAccountData.savings + msg.value;
        oldAccountData.timeLock = now + _time;

        accountData[msg.sender] = oldAccountData;
    } else {
        
        data memory newAccountData;
        newAccountData.client = msg.sender;
        newAccountData.savings = msg.value;
        newAccountData.timeLock = now + _time;

        accountData[msg.sender] = newAccountData;
    }
}

function withrawMoney(uint256 _amount) public payable accountExists {
    
    
    require(
        now >= accountData[msg.sender].timeLock,
        "You can't withdraw your money yet."
    );
    
    require(
        _amount <= accountData[msg.sender].savings,
        "You can't withdraw more than you have."
    );

    address client = accountData[msg.sender].client;
    accountData[msg.sender].savings =
        accountData[msg.sender].savings -
        _amount;
    client.transfer(_amount);
}

function getAccount()
    external
    view
    accountExists
    returns (uint256, uint256)
{
    if (accountData[msg.sender].timeLock < now) {
        uint256 timeRemaining = 0;
    } else {
        timeRemaining = accountData[msg.sender].timeLock - now;
    }
    return (accountData[msg.sender].savings, timeRemaining);
}

modifier accountExists() {
    require(
        accountData[msg.sender].client != address(0),
        "Account does not exists."
    );
    _; 
}
}
