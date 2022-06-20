    pragma solidity ^0.8.6;




import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract YieldFarm {
    mapping(address => uint256) public stakingBalance;
    mapping(address => bool) public hasStaked;
    mapping(address => bool) public isStaking;
    mapping(address => uint256) public startTime;
    mapping(address => uint256) public rubyBalance;
    uint256 contractBalance;

    string public name = "RubyFarm";

    event Stake(address indexed from, uint256 amount);
    event Unstake(address indexed from, uint256 amount);
    event YieldWithdraw(address indexed to, uint256 amount);

    IERC20 public rubies;

    

    constructor(IERC20 _rubies) public {
        

        rubies = _rubies;

        address owner = msg.sender;
    }
    

    

    function stakeTokens(uint256 _amount) public {
        require(
            _amount > 0 && rubies.balanceOf(msg.sender) >= _amount,
            "You ain't got enough money to stake this amount!"
        );

        

        if (isStaking[msg.sender] == true) {
            uint256 toTransfer = calculateYieldTotal(msg.sender);
            rubyBalance[msg.sender] += toTransfer;
        }

        

        contractBalance = contractBalance + _amount;

        
        IERC20(rubies).transferFrom(msg.sender, address(this), _amount);

        
        stakingBalance[msg.sender] = stakingBalance[msg.sender] + _amount;

startTime[msg.sender] = block.timestamp;

        
        isStaking[msg.sender] = true;
        hasStaked[msg.sender] = true;
    }
}