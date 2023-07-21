
pragma solidity ^0.8.0;

import "https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract MyToken {
    string public name;
    string public symbol;
    uint256 public decimals = 18;
    uint256 public totalSupply;
    uint256 public totalStakedBalance;
    uint256 public rewardRate = 300; 
    uint256 public constant rewardInterval = 72 hours;
    uint256 public constant maxRewardRate = 500; 
    uint256 public constant minStakeAmount = 5 * 10**18;
    address[] public stakeHolders;
    uint256 public stakeRewards = 10000000000 * (10 ** decimals);
    uint256 public circulatingSupply = 20000000000 * (10 ** decimals);
    uint256 public initialSupply = 40000000000 * (10 ** decimals);
    uint256 public mineRewards = 5000000000 * (10 ** decimals);
    uint256 public airdrops = 5000000000 * (10 ** decimals);
    uint256 public totalTokensSold;
    uint256 public constant tokenPrice = 5 * 10**18;
    uint256 public tokensLeft;
    address public owner;

    mapping(address => uint256) public votes;
    mapping(address => address) public hasVoted;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    mapping(address => bool) public isStaking;
    mapping(address => uint256) public stakeTime;
    mapping(address => uint256) public stakedBalance;
    mapping(address => uint256) public rewardBalance;
    mapping(address => uint256) public lastClaimTime;
    mapping(address => bool) hasMined;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Staking(address indexed staker, uint256 value);
    event Unstaking(address indexed unstaker, uint256 value);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event RewardClaimed(address indexed user, uint256 reward);
    event RewardWithdrawn(address indexed user, uint256 reward);
    event EmergencyWithdrawal(address indexed user, uint256 reward);
    event MintAndBurn(uint256 value, uint256 initialTotalSupply, uint256 finalTotalSupply);
    event Airdrop(address indexed recipient, uint256 value);



   constructor(string memory _name, string memory _symbol) payable {
        name = _name;
        symbol = _symbol;

        balanceOf[msg.sender] = initialSupply;
        
        balanceOf[address(this)] += circulatingSupply;

        
        balanceOf[msg.sender] += stakeRewards;

        
        balanceOf[msg.sender] += mineRewards;

        
        balanceOf[msg.sender] += airdrops;

        totalSupply = initialSupply;
        owner = msg.sender;
    }


    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function transfer(address to, uint256 value) public returns (bool success) {
        
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) public returns (bool success) {
        require(spender != address(0), "Invalid spender address");
        require(value <= balanceOf[msg.sender], "Insufficient balance to approve");
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }


    function transferFrom(address from, address to, uint256 value) public returns (bool success) {
        require(msg.sender != address(0), "Invalid sender address");
        require(from != address(0), "Invalid from address");
        require(to != address(0), "Invalid to address");
        require(balanceOf[from] >= value, "Insufficient balance");
        require(allowance[from][msg.sender] >= value, "Not authorized to spend this amount");
        require(from != to, "Cannot transfer to the same address");

        
        allowance[from][msg.sender] -= value;

        balanceOf[from] -= value;
        balanceOf[to] += value;

        emit Transfer(from, to, value);
        return true;
    }



    function airdrop(address[] memory recipients, uint256[] memory values) public onlyOwner returns (bool success) {
        require(recipients.length == values.length, "Invalid input arrays");

        uint256 totalValue = 0;
        for (uint256 i = 0; i < recipients.length; i++) {
            require(values[i] > 0, "Invalid airdrop value");
            require(recipients[i] != address(0), "Invalid recipient address");
            totalValue += values[i];
        }

        require(totalValue <= airdrops, "Insufficient airdrop balance");

        for (uint256 i = 0; i < recipients.length; i++) {
            transfer(recipients[i], values[i] * (10 ** decimals));
            emit Airdrop(recipients[i], values[i]);
        }

        airdrops -= totalValue;

        return true;
    }


































    function setRewardRate(uint256 _rewardRate) public {
        require(msg.sender == owner, "Not authorized");
        require(_rewardRate <= maxRewardRate, "Exceeded maximum reward rate");
        rewardRate = _rewardRate;
    }

    function getStakedAddresses() public view returns (address[] memory) {
        return stakeHolders;
    }

    function stake(uint256 _amount) public payable returns (bool success) {
        require(_amount >= minStakeAmount, "Stake amount can't be less than minStakeAmount");
        require(balanceOf[msg.sender] >= _amount, "Insufficient balance");
        require(!isStaking[msg.sender], "Already staking");
        require(_amount > 0, "Invalid staking amount");
        balanceOf[msg.sender] -= _amount;
        stakedBalance[msg.sender] += _amount;
        totalStakedBalance += _amount;
        isStaking[msg.sender] = true;
        stakeHolders.push(msg.sender);
        stakeTime[msg.sender] = block.timestamp;
        emit Staking(msg.sender, _amount);
        return true;
    }

    function unstake(uint256 _amount) public returns (bool success) {
        require(stakedBalance[msg.sender] > 0, "No staked balance");
        require(isStaking[msg.sender], "You are not staking");
        require(stakedBalance[msg.sender] >= _amount, "Insufficient staked balance");
        uint256 stakingPeriod = block.timestamp - stakeTime[msg.sender];
        uint256 reward = (stakedBalance[msg.sender] * rewardRate * stakingPeriod) / (rewardInterval * 100);
        isStaking[msg.sender] = false;
        stakedBalance[msg.sender] -= _amount;
        totalStakedBalance -= _amount;
        balanceOf[msg.sender] += _amount + reward;
        emit Unstaking(msg.sender, _amount);
        return true;
    }

    function claimReward() public {
        require(stakedBalance[msg.sender] > 0, "No staked balance");
        uint256 timeSinceLastClaim = block.timestamp - lastClaimTime[msg.sender];
        uint256 reward = (stakedBalance[msg.sender] * rewardRate * timeSinceLastClaim) / (rewardInterval * 100);
        require(reward > 0, "No rewards available");
        rewardBalance[msg.sender] += reward;
        lastClaimTime[msg.sender] = block.timestamp;
        emit RewardClaimed(msg.sender, reward);
    }

    function withdrawRewards() public {
        require(rewardBalance[msg.sender] > 0, "No rewards available");
        uint256 rewardAmount = rewardBalance[msg.sender];
        rewardBalance[msg.sender] = 0;
        stakeRewards -= rewardAmount; 
        balanceOf[msg.sender] += rewardAmount;
        emit RewardWithdrawn(msg.sender, rewardAmount);
    }


    function emergencyWithdraw() public {
        require(stakedBalance[msg.sender] > 0, "No staked balance");
        uint256 stakedAmount = stakedBalance[msg.sender];
        stakedBalance[msg.sender] = 0;
        totalStakedBalance -= stakedAmount;
        balanceOf[msg.sender] += stakedAmount;
        emit EmergencyWithdrawal(msg.sender, stakedAmount);
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    function burn(uint256 value) public onlyOwner returns (bool success) {
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        totalSupply -= value;
        balanceOf[msg.sender] -= value;
        emit Transfer(msg.sender, address(0), value);
        return true;
    }

    uint256 constant MINING_INTERVAL = 3 days;
    
    uint256 constant INFLATION_RATE = 1;
    
    mapping(address => uint256) lastMiningTime;

    function mine() public returns (bool) {
        
        require(!hasMined[msg.sender], "You have already mined in this interval");

        
        require(lastMiningTime[msg.sender] + MINING_INTERVAL <= block.timestamp, "You must wait before mining again");

        
        lastMiningTime[msg.sender] = block.timestamp;
        hasMined[msg.sender] = true;

        
        uint256 tokensToMint = (mineRewards * INFLATION_RATE) / 100;

        
        require(mineRewards > 0, "no further tokens can be mined");

        
        uint256 minedTokens = (mineRewards * INFLATION_RATE) / 1000;
        mineRewards -= minedTokens;
        balanceOf[msg.sender] += minedTokens;

        
        totalSupply += tokensToMint;

        
        emit Transfer(address(0), msg.sender, minedTokens);
        emit Transfer(address(0), msg.sender, tokensToMint);

        
        return true;
    }
    
    function buyTokens(uint256 tokensToBuy) public payable {
        uint256 totalTokens = tokensToBuy;
        tokensLeft = initialSupply - totalTokensSold;

        require(tokensLeft >= totalTokens, "Insufficient tokens left for sale");

        uint256 costInWei = tokenPrice * totalTokens;
        require(msg.value >= costInWei, "Insufficient Ether sent");

        totalTokensSold += totalTokens;
        balanceOf[msg.sender] += totalTokens;

        emit Transfer(address(0), msg.sender, totalTokens);
        circulatingSupply -= totalTokens;
        uint256 refund = msg.value - costInWei;
        if (refund > 0) {
            payable(msg.sender).transfer(refund);
        }
    }

    function getMaticAmountAndPrice(uint256 tokensToBuy, address priceFeed) external view returns (uint256, uint256) {
        
        AggregatorV3Interface aggregator = AggregatorV3Interface(priceFeed);
        (, int256 price, , uint256 updatedAt, ) = aggregator.latestRoundData();
        require(block.timestamp >= updatedAt + 10, "Price feed not ready");
        uint256 maticPriceInUSD = uint256(price);

        
        uint256 costInWei = tokenPrice * tokensToBuy;
        uint256 costInMatic = costInWei / 1 ether;

        
        uint256 costInUSD = costInMatic * maticPriceInUSD / 1e18;
        return (costInMatic, costInUSD);
    }




    function vote(address candidate) public returns (bool success) {
        require(candidate != address(0), "Invalid candidate address");
        require(balanceOf[msg.sender] >= 1, "Insufficient balance");
        require(candidate != msg.sender, "You cannot vote for yourself");
        require(hasVoted[msg.sender] != candidate, "You have already voted for this candidate");

        votes[candidate] += 1;
        hasVoted[msg.sender] = candidate;
        balanceOf[msg.sender] -= 1;
        emit Transfer(msg.sender, address(0), 1);
        return true;
    }

    function getVoteCount(address candidate) public view returns (uint256 count) {
        require(candidate != address(0), "Invalid candidate address");
        return votes[candidate];
    }

    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "Only owner can call this function");
        require(address(this).balance >= amount, "Insufficient contract balance");
        payable(msg.sender).transfer(amount);
    }
}   
