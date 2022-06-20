
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/Context.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract StarzBit is Ownable {
    using SafeERC20 for IERC20;

    struct Deposit {
        uint index;
        uint checkpoint;
    }

    struct User {
        address referer;
        address account;
        Deposit[] deposits;
        uint[] partners;
        uint totalDeposit;
        uint totalWithdrawn;
        uint totalBonus;
        uint directBonus;
        uint teamBonus;
        uint checkpoint;
    }

    struct Level {
        uint level;
        uint lvl0; 
        uint lvl1;
        uint lvl2;
        uint lvl3;
        uint lvl4;
        uint team; 
    }

    IERC20 public token;
    uint public price;
    uint public maxUnits = 2;
    uint public minUnits = 1;
    uint public totalDeposit;
    uint public depositCount;
    uint public totalBonus;
    uint public totalWithdrawn;
    uint public totalCommission;
    uint public totalUsers;
    uint public commissionFeeRate = 100;
    uint public levelStep = 3;

    uint[] public referRate = [8, 5, 3, 2];
    address[] public team;
    uint public teamRate = 20;
    uint public marketingFee = 50;
    address public marketingWallet = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    address public firstWallet = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bool enabled = false;

    mapping(address => uint) public userids;
    mapping(uint => User) public users;
    mapping(uint => Level) public levels;
    mapping(uint => address) public depositIndexToAccount;

    event UserMsg(uint userid, string msg, uint value);
    event Commission(uint value);

    constructor(IERC20 _token, uint _price) {
        token = _token;
        price = _price;
    }

    receive() external payable {}

    function invest(address referer, uint units) external {
        require(enabled, "Pool Not Enabled");
        require(units >= minUnits, "Less than Min Units");
        require(units <= maxUnits, "Over than Max Units");

        uint userid = userids[msg.sender];
        if (userid == 0) {
            totalUsers += 1;
            userid = totalUsers;
            userids[msg.sender] = userid;
            emit UserMsg(userid, "Joined", 0);
        }

        User storage user = users[userid];
        if (user.account == address(0)) {
            user.account = msg.sender;
            user.checkpoint = block.timestamp;
        }

        if (user.referer == address(0) && referer != address(0)) {
            if (users[userids[referer]].totalDeposit > 0 && referer != msg.sender && user.totalDeposit == 0) {
                user.referer = referer;
                users[userids[referer]].partners.push(userid);
                processLevelUpdate(referer, msg.sender);

                address parent = referer;
                for (uint i = 0; i < 5; i++) {
                    if (parent == address(0)) break;
                    levels[userids[parent]].team += 1;
                    parent = users[userids[parent]].referer;
                }
            }
        }
        
        
        processDeposit(units);
        payReferral(referer, units);
    }

    function payForCommission(address referer, uint value) private returns (uint){
        address upline = referer;

        uint totalRefOut;
        for (uint i = 0; i < referRate.length; i++) {
            uint uplineId = userids[upline];
            if (uplineId == 0) break;
            if (upline != address(0) && levels[uplineId].level > i) {
                    uint bonus = value * referRate[i] / 1000;
                    totalRefOut = totalRefOut + bonus;
                    token.safeTransfer(upline, bonus);
                    
                    emit UserMsg(uplineId, "RefBonus", bonus);
                    users[uplineId].totalBonus += bonus;
                    if (i == 0) {
                        users[uplineId].directBonus += bonus;
                    }
                
                upline = users[uplineId].referer;
            } else break;
        }

        for (uint i = 0; i < team.length; i++) {
            uint bonus = value * teamRate / 1000 / team.length;
            totalRefOut += bonus;
            token.safeTransfer(team[i], bonus / team.length);
            
            emit UserMsg(userids[team[i]], "TeamBonus", bonus);
            users[userids[team[i]]].totalBonus += bonus;
            users[userids[team[i]]].teamBonus += bonus;
        }
        
        totalBonus += totalRefOut;
        uint marketingOut = value * marketingFee / 1000;
        token.safeTransfer(marketingWallet, marketingOut);

        uint commi = totalRefOut + marketingOut;
        emit Commission(commi);
        return commi;
    }

    function getCommissionRate() public view returns(uint) {
            return commissionFeeRate;
        }

    function payReferral(address referer, uint units) private {
        
        uint value = price * units;
        uint commission = value * commissionFeeRate / 1000;
        uint totalRefOut;

        address upline = referer;

        for (uint i = 0; i < referRate.length; i++) {
            uint uplineId = userids[upline];
            if (uplineId == 0) break;
            if (upline != address(0) && levels[uplineId].level > i) {
                if (users[uplineId].totalDeposit > users[uplineId].totalWithdrawn) {
                    uint bonus = value * referRate[i] / 1000;
                    totalRefOut = totalRefOut + bonus;
                    token.safeTransfer(upline, bonus);
                    
                    emit UserMsg(uplineId, "RefBonus", bonus);
                    users[uplineId].totalBonus += bonus;
                    if (i == 0) {
                        users[uplineId].directBonus += bonus;
                    }
                }
                upline = users[uplineId].referer;
            } else break;
        }

        for (uint i = 0; i < team.length; i++) {
            uint bonus = value * teamRate / 1000 / team.length;
            totalRefOut += bonus;
            token.safeTransfer(team[i], bonus / team.length);
            
            emit UserMsg(userids[team[i]], "TeamBonus", bonus);
            users[userids[team[i]]].totalBonus += bonus;
            users[userids[team[i]]].teamBonus += bonus;
        }

        uint commi = commission - totalRefOut;
        token.safeTransfer(marketingWallet, commi);
        emit Commission(commi);
        totalBonus += totalRefOut;
        totalCommission += commission;
    }

    function processLevelUpdate(address referer, address from) private {
        if (referer == address(0)) return;
        uint refererid = userids[referer];
        if (refererid == 0) return;
        uint fromid = userids[from];

        User storage user = users[refererid];
        Level storage level = levels[refererid];

        if (levels[fromid].level == 0) {
            level.lvl0++;
            if (level.lvl0 >= levelStep && level.level < 1) {
                level.level = 1;
                emit UserMsg(refererid, "LevelUp", 1);
                processLevelUpdate(user.referer, referer);
            }
        } else if (levels[fromid].level == 1) {
            level.lvl1++;
            if (level.lvl1 >= levelStep && level.level < 2) {
                level.level = 2;
                emit UserMsg(userids[referer], "LevelUp", 2);
                processLevelUpdate(user.referer, referer);
            }
        } else if (levels[fromid].level == 2) {
            level.lvl2++;
            if (level.lvl2 >= levelStep && level.level < 3) {
                level.level = 3;
                emit UserMsg(userids[referer], "LevelUp", 3);
                processLevelUpdate(user.referer, referer);
            }
        } else if (levels[fromid].level == 3) {
            level.lvl3++;
            if (level.lvl3 >= levelStep && level.level < 4) {
                level.level = 4;
                emit UserMsg(userids[referer], "LevelUp", 4);
                processLevelUpdate(user.referer, referer);
            }
        } else if (levels[fromid].level == 4) {
            level.lvl4++;
            if (level.lvl4 >= levelStep && level.level < 5) {
                level.level = 5;
                emit UserMsg(userids[referer], "LevelUp", 5);
                processLevelUpdate(user.referer, referer);
            }
        } 
    }

    function processDeposit(uint units) private returns (uint value) {
        uint userid = userids[msg.sender];
        User storage user = users[userid];
        require(userAllocated(msg.sender) >= user.totalDeposit, "Less Allocated");

        value = units * price;
        token.safeTransferFrom(msg.sender, address(this), value);
        totalDeposit += value;

        emit UserMsg(userid, "Deposit", value);

        for (uint i = 0; i < units; i++) {
            Deposit memory deposit = Deposit(depositCount + i, block.timestamp);
            user.deposits.push(deposit);
            depositIndexToAccount[depositCount + i] = msg.sender;
            
        }
        
        depositCount += units;
        user.totalDeposit += value;
    }

    function claim() external {
        uint userid = userids[msg.sender];
        User storage user = users[userid];
        uint allocated = userAllocated(msg.sender);
        require(allocated > user.totalWithdrawn, "No more allocated");
        uint topay = allocated - user.totalWithdrawn;
        user.totalWithdrawn += topay;
        totalWithdrawn += topay;
        emit UserMsg(userid, "Claim", topay);
    }

    function userAllocated(address account) public view returns (uint) {
        if (depositCount < 1) return 0;
        uint userid = userids[account];
        User storage user = users[userid];
        uint weight;
        for (uint i = 0; i < user.deposits.length; i += 1) {
            weight += (depositCount - user.deposits[i].index);
        }
        return totalDeposit * weight / totalWeight();
    }

    function userPercent(address account) public view returns (uint) {
        return userWeight(account) * depositCount * 100 / totalWeight();
    }

    function userWeight(address account) public view returns (uint) {
        uint userid = userids[account];
        User storage user = users[userid];
        uint weight;
        for (uint i = 0; i < user.deposits.length; i += 1) {
            weight += (depositCount - user.deposits[i].index);
        }
        return weight;
    }

    function totalWeight() public view returns (uint) {
        return depositCount * (depositCount + 1) / 2;
    }

    function userInfoById(uint id) public view returns(uint, uint, User memory, Level memory) {
        User storage user = users[id];
        Level storage level = levels[id];
        return (id, userids[user.referer], user, level);
    }

    function userInfoByAddress(address account) public view returns(uint, uint, User memory, Level memory) {
        uint userid = userids[account];
        return userInfoById(userid);
    }

    function partnerIdsById(uint id) public view returns (uint[] memory){
        User storage user = users[id];
        return user.partners;
    }

    function withdraw(uint amount) external onlyOwner {
        if (address(this).balance > 0) {
            payable(msg.sender).transfer(address(this).balance);
        }
        if (token.balanceOf(address(this)) > 0) {
            token.safeTransfer(msg.sender, amount);
        }
    }

    function setCommissionFeeRate(uint rate) external onlyOwner {
        commissionFeeRate = rate;
    }

    function setReferRate(uint[] memory rates) external onlyOwner {
        referRate = rates;
    }

    function setLevelStep(uint step) external onlyOwner {
        levelStep = step;
    }

    function levelteam() public view returns (address [] memory) {
        return team;
    }

    function setMarketingWallet(address wallet) external onlyOwner {
        marketingWallet = wallet;
    }

    function setEnabled(bool action) external onlyOwner {
        enabled = action;
    }

    function setToken(IERC20 _token) external onlyOwner {
        token = _token;
    }

    function setPrice(uint _price) external onlyOwner {
        price = _price;
    }

    function setMaxUnits(uint units) external onlyOwner {
        maxUnits = units;
    }

    function setMinUnits(uint units) external onlyOwner {
        minUnits = units;
    }

    function setMarketingFee(uint fee) external onlyOwner {
        marketingFee = fee;
    }

    function siteInfo() external view returns (uint, uint, uint, uint, uint, uint, uint, uint, bool) {
        return (price, minUnits, maxUnits, totalDeposit, depositCount, totalBonus, totalWithdrawn, totalUsers, enabled);
    }
}
