pragma solidity ^0.6.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";

interface AbcToken {
    function transfer(address dst, uint256 wad) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 wad
    ) external returns (bool);

    function balanceOf(address user) external view returns (uint256);

    function approve(address _spender, uint256 _value) external returns (bool);
}

contract AbcFarm is Ownable {
    using SafeMath for uint256;

    string public name = "AbcFarm"; 

    AbcToken public abcToken;

    address[] public stakers;

    mapping(address => uint256) public startTime;
    mapping(address => uint256) public stakingBalance;
    mapping(address => uint256) public abcBalance;
    mapping(address => bool) public isStaking;

    constructor(AbcToken _abcToken) public {
        abcToken = _abcToken;
    }

    function stake(uint256 _amount) public {
        require(_amount > 0, "You cannot stake zero tokens");
        abcToken.transferFrom(msg.sender, address(this), _amount);
        stakingBalance[msg.sender] = SafeMath.add(
            stakingBalance[msg.sender],
            _amount
        );
        isStaking[msg.sender] = true;
        startTime[msg.sender] = block.timestamp;
    }

    function withdrawYield() public {
        require(
            abcBalance[msg.sender] > 0 ||
                startTime[msg.sender] != block.timestamp
        );
        uint256 timeStaked = calculateYieldTime(msg.sender);
        uint256 bal = SafeMath.div(
            SafeMath.mul(stakingBalance[msg.sender], timeStaked),
            100
        );
        if (abcBalance[msg.sender] != 0) {
            uint256 oldBal = abcBalance[msg.sender];
            abcBalance[msg.sender] = 0;
            bal = SafeMath.add(bal, oldBal);
        }
        startTime[msg.sender] = block.timestamp;
        abcToken.transfer(msg.sender, bal);
    }

    function calculateYieldTime(address _usr) public view returns (uint256) {
        uint256 end = block.timestamp;
        uint256 totalTime = SafeMath.sub(end, startTime[_usr]);
        uint256 inMinutes = SafeMath.div(totalTime, 60);
        return inMinutes;
    }

    function unstake() public {
        require(isStaking[msg.sender] = true, "You are not staking tokens");
        uint256 timeStaked = calculateYieldTime(msg.sender);
        uint256 yield = SafeMath.div(
            SafeMath.mul(stakingBalance[msg.sender], timeStaked),
            100
        );
        startTime[msg.sender] = block.timestamp;
        abcBalance[msg.sender] = SafeMath.add(abcBalance[msg.sender], yield);

        uint256 balance = stakingBalance[msg.sender];
        require(balance > 0, "You do not have funds to fetch");
        stakingBalance[msg.sender] = 0;
        abcToken.transfer(msg.sender, balance);
        isStaking[msg.sender] = false;
    }
}
