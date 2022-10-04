uint256 timeLocked = 1589026500;

event Transfer(address _from, address _to, uint256);

mapping(address => uint256) private balance;


modifier timeChecker{
    require(block.timestamp >= timeLocked, "ERC20: time locked for certain period");
    _;
}

function lockCall() public timeChecker {
    uint256 value = 10;
    address receiver = 0xDd395D13d892Fb482e5E7392e0f58BC4F55c9d69;

    require(msg.sender != address(0));

    balance[receiver] = balance[receiver] + value;
    emit Transfer(address(msg.sender), address(receiver), value);
}


function balanceOf(address account) public view returns(uint256){
    return balance[account];
}
