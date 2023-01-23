
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract BUSDMinerProtocol is Ownable, ReentrancyGuard {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    address public immutable BUSD;
    address public adminAddress = 
    mapping(address => UserInfo) public userInfo;

    uint256 public contractInitializedAt;
    bool public emergencyWidthdrawal = false;

    uint256 public dailyReturnsInBPS = 300;
    uint256 public totalInvestments;
    uint256 public totalParticipants;
    uint256 public totalPayouts;
    uint256 public adminFee = 5000000000000000000; 
    uint256 public withdrawalFeeInBPS = 250;
    uint256 public minCompoundingAmount = 10000000000000000000;
    uint256 public minInvestment = 50000000000000000000;
    uint256 public stakingDuration = 30 days;
    uint256 maxGenerations = 1;

    mapping(address => ReferrerInfo) public referrers;
    mapping(address => UserReferralInfo[]) public userReferrals;
    mapping(address => uint256) public referralsCount;
    mapping(address => uint256) public totalReferralCommissions;
    uint256 public referralCommisionInBPS = 1000;
    LeadershipInfo[] public leadershipPositionsReward;

    struct LeadershipInfo {
        uint256 sales;
        uint256 reward;
    }

    struct ReferrerInfo {
        address referrer;
        bool initialReward;
        uint256 totalEarnings;
    }

    struct UserReferralInfo {
        address user;
        int256 debt;
    }

    struct UserInfo {
        uint256 currentLeadershipPosition; 
        uint256 totalInvestments;
        uint256 lastWithdrawn;
        uint256 amount;
        uint256 debt;
        uint256 referralDebt;
        uint256 initialTime;
        uint256 totalWithdrawal;
        uint256 withdrawnAt;
        uint256 reinvestmentDeadline;
        uint256 lockEndTime;
        uint256 leadershipScore;
    }

    event ReferralRecorded(address indexed user, address indexed referrer);
    event ReferralCommissionPaid(
        address indexed user,
        address indexed referrer,
        uint256 commissionAmount
    );
    event ReferralCommissionRecorded(
        address indexed referrer,
        uint256 commission
    );

    constructor(address _busd) {
        BUSD = _busd;
        contractInitializedAt = block.timestamp;
        leadershipPositionsReward.push(
            LeadershipInfo(20000000000000000000000, 200000000000000000000)
        );
        leadershipPositionsReward.push(
            LeadershipInfo(50000000000000000000000, 1000000000000000000000)
        );
        leadershipPositionsReward.push(
            LeadershipInfo(120000000000000000000000, 2500000000000000000000)
        );
        leadershipPositionsReward.push(
            LeadershipInfo(250000000000000000000000, 5000000000000000000000)
        );
        leadershipPositionsReward.push(
            LeadershipInfo(500000000000000000000000, 10000000000000000000000)
        );
        leadershipPositionsReward.push(
            LeadershipInfo(750000000000000000000000, 15000000000000000000000)
        );
        leadershipPositionsReward.push(
            LeadershipInfo(1000000000000000000000000, 20000000000000000000000)
        );
    }

    function clearPreviousStaking(address _account) internal {
        UserInfo memory user = userInfo[_account];
        uint256 _debtAmount = user.debt;
        user.withdrawnAt = 0;
        user.lastWithdrawn = 0;
        user.initialTime = block.timestamp;
        user.lockEndTime = user.initialTime + stakingDuration;
        user.debt = 0;
        user.referralDebt = 0;
        userInfo[_account] = user;

        if (_debtAmount > 0) {
            totalPayouts = totalPayouts.add(_debtAmount);
            IERC20(BUSD).transfer(_account, _debtAmount);
        }
    }

    function getUserDetails(address _account)
        external
        view
        returns (UserInfo memory, uint256)
    {
        uint256 reward = getRewards(_account);
        UserInfo memory user = userInfo[_account];
        return (user, reward);
    }

    function getUserReferrals(address _user)
        public
        view
        returns (UserReferralInfo[] memory)
    {
        return userReferrals[_user];
    }

    function getRewards(address _account) public view returns (uint256) {
        uint256 pendingReward = 0;
        UserInfo memory user = userInfo[_account];
        if (user.lastWithdrawn > 0) {
            if (user.reinvestmentDeadline < block.timestamp) {
                return 0;
            } else {
                return user.debt;
            }
        }
        if (user.amount > 0) {
            uint256 stakeAmount = user.amount;
            uint256 timeDiff;
            unchecked {
                timeDiff = block.timestamp - user.initialTime;
            }
            if (timeDiff >= stakingDuration) {
                uint256 stakingDurationInNum = 30;
                return
                    stakeAmount.mul(dailyReturnsInBPS).div(10000).mul(
                        stakingDurationInNum
                    );
            }
            uint256 returnsIn30days = dailyReturnsInBPS * 30;
            uint256 rewardAmount = (((stakeAmount * returnsIn30days) / 10000) *
                timeDiff) / stakingDuration;
            pendingReward = rewardAmount;
        }

        uint256 pending = user.debt.add(pendingReward);
        return pending;
    }

    function setDailyReturns(uint256 _dailyReturnsInBPS) public {
        dailyReturnsInBPS = _dailyReturnsInBPS;
    }

    function getReferralRewards(address _account)
        public
        view
        returns (uint256)
    {
        int256 pendingReward = 0;
        for (uint256 i = 0; i < userReferrals[_account].length; i++) {
            pendingReward = pendingReward + userReferrals[_account][i].debt;
            uint256 userRewards = getRewards(userReferrals[_account][i].user);
            uint256 rewardsPercentage = 15;
            pendingReward =
                pendingReward +
                (int256(userRewards.mul(rewardsPercentage).div(100)));
        }

        return uint256(pendingReward);
    }

    function addReferralDebt(address _account) internal {
        ReferrerInfo memory _referrer = getReferrer(_account);
        if (_referrer.referrer != address(0)) {
            uint256 userReward = getRewards(_account);
            UserReferralInfo memory referredUser;
            uint256 index;

            for (
                uint256 i = 0;
                i < userReferrals[_referrer.referrer].length;
                i++
            ) {
                if (userReferrals[_referrer.referrer][i].user == _account) {
                    index = i;
                    referredUser = userReferrals[_referrer.referrer][i];
                    break;
                }
            }

            if (referredUser.user != address(0)) {
                uint256 rewardsPercentage = 15;
                referredUser.debt =
                    referredUser.debt +
                    int256(userReward.mul(rewardsPercentage).div(100));
                userReferrals[_referrer.referrer][index] = referredUser;
            }
        }
    }

    function invest(uint256 _amount) external nonReentrant {
        require(adminFee < _amount, "Incorrect request!");

        UserInfo memory user = userInfo[msg.sender];
        uint256 investment = _amount - adminFee;

        if (user.totalInvestments > 0) {
            if (user.lastWithdrawn > 0) {
                if (user.reinvestmentDeadline < block.timestamp) {
                    user.debt = 0;
                } else {
                    uint256 reinvestmentPercent = 50;
                    uint256 _minimumInvestment = user
                        .lastWithdrawn
                        .mul(reinvestmentPercent)
                        .div(100);
                    require(
                        investment >= _minimumInvestment,
                        "Invest at least 50% of your previous earning"
                    );
                }
                addReferralDebt(msg.sender);
                clearPreviousStaking(msg.sender);
            } else {
                if (user.debt > 0 || user.amount > 0) {
                    require(
                        investment >= minCompoundingAmount,
                        "Minimum compounding is 10 busd"
                    );
                } else {
                    require(
                        investment >= minInvestment,
                        "Minimum investment is 50 busd"
                    );
                }
            }
        } else {
            require(
                investment >= minInvestment,
                "Minimum investment is 50 busd"
            );
        }

        IERC20(BUSD).transferFrom(msg.sender, address(this), _amount);
        IERC20(BUSD).transfer(adminAddress, adminFee);

        if (user.totalInvestments < 1) {
            totalParticipants = totalParticipants.add(1);
            user.initialTime = block.timestamp;
            user.lockEndTime = user.initialTime + stakingDuration;
        }

        user.totalInvestments = user.totalInvestments.add(investment);
        user.amount = user.amount.add(investment);
        totalInvestments = totalInvestments.add(investment);

        userInfo[msg.sender] = user;

        payReferrerCommission(msg.sender, investment);
    }

    function clearReferralDebt(address _account) internal {
        for (uint256 i = 0; i < userReferrals[_account].length; i++) {
            UserReferralInfo memory usr = userReferrals[_account][i];
            uint256 userRewards = getRewards(usr.user);
            uint256 rewardsPercentage = 15;
            usr.debt = 0 - int256(userRewards.mul(rewardsPercentage).div(100));
            userReferrals[_account][i] = usr;
        }
    }

    function withdraw() external nonReentrant {
        if (emergencyWidthdrawal) {
            UserInfo memory user = userInfo[msg.sender];
            uint256 _withdrawalAmount = user.amount;
            user.amount = 0;
            user.debt = 0;
            user.referralDebt = 0;
            user.lastWithdrawn = 0;
            user.lastWithdrawn = _withdrawalAmount;
            user.totalWithdrawal = user.totalWithdrawal.add(_withdrawalAmount);
            user.withdrawnAt = block.timestamp;

            userInfo[msg.sender] = user;

            IERC20(BUSD).transfer(msg.sender, _withdrawalAmount);
        } else {
            UserInfo memory user = userInfo[msg.sender];
            uint256 totalBalance = getRewards(msg.sender) +
                getReferralRewards(msg.sender) +
                user.amount + user.referralDebt;

            require(totalBalance > 0, "withdraw: insufficient amount");
            uint256 _withdrawalAmount = totalBalance;

            if (user.lockEndTime > block.timestamp) {
                user.amount = 0;
                user.debt = 0;
                user.referralDebt = 0;
                _withdrawalAmount = _withdrawalAmount.div(2);
                totalPayouts = totalPayouts.add(_withdrawalAmount);
                user.lastWithdrawn = 0;
            } else {
                _withdrawalAmount = _withdrawalAmount.mul(70).div(100);
                totalPayouts = totalPayouts.add(_withdrawalAmount);
                user.debt = totalBalance.sub(_withdrawalAmount);
                user.referralDebt = 0;
                user.amount = 0;
                user.lastWithdrawn = _withdrawalAmount;
                user.reinvestmentDeadline = block.timestamp + 1 days;
            }

            user.totalWithdrawal = user.totalWithdrawal.add(_withdrawalAmount);
            user.withdrawnAt = block.timestamp;

            userInfo[msg.sender] = user;
            addReferralDebt(msg.sender);
            clearReferralDebt(msg.sender);

            IERC20(BUSD).transfer(
                msg.sender,
                _withdrawalAmount.sub(
                    _withdrawalAmount.mul(withdrawalFeeInBPS).div(10000)
                )
            );
        }
    }

    function harvest() external nonReentrant {
        UserInfo memory user = userInfo[msg.sender];
        uint256 refReward = getReferralRewards(msg.sender);
        uint256 rewardAmount = getRewards(msg.sender) + refReward + user.referralDebt;
        require(rewardAmount >= 0, "harvest: not enough funds");

        if (refReward > 0) {
            clearReferralDebt(msg.sender);
        }
        addReferralDebt(msg.sender);

        user.debt = 0;
        user.referralDebt = 0;
        user.initialTime = block.timestamp;
        user.lockEndTime = user.initialTime + stakingDuration;
        user.totalWithdrawal = user.totalWithdrawal.add(rewardAmount);
        user.withdrawnAt = block.timestamp;
        userInfo[msg.sender] = user;

        totalPayouts = totalPayouts.add(rewardAmount);

        IERC20(BUSD).transfer(
            msg.sender,
            rewardAmount.sub(rewardAmount.mul(withdrawalFeeInBPS).div(10000))
        );
    }

    function recordReferral(address _user, address _referrer) public {
        if (
            _user != address(0) &&
            _referrer != address(0) &&
            _user != _referrer &&
            referrers[_user].referrer == address(0)
        ) {
            referrers[_user].referrer = _referrer;
            referralsCount[_referrer] += 1;
            userReferrals[_referrer].push(UserReferralInfo(_user, 0));
            emit ReferralRecorded(_user, _referrer);
        }
    }

    function getReferrer(address _user)
        public
        view
        returns (ReferrerInfo memory)
    {
        return referrers[_user];
    }

    function calcReferralReward(uint256 _amount)
        private
        view
        returns (uint256)
    {
        return _amount.mul(referralCommisionInBPS).div(10000);
    }

    function payReferrerCommission(address _user, uint256 _transactionAmount)
        internal
    {
        ReferrerInfo memory referrerInfo = getReferrer(_user);
        if (referrerInfo.referrer != address(0)) {
            UserInfo memory referrerUserInfo = userInfo[referrerInfo.referrer];
            referrerUserInfo.leadershipScore = referrerUserInfo
                .leadershipScore
                .add(_transactionAmount);
            uint256 currentPosition = referrerUserInfo
                .currentLeadershipPosition;
            uint256 points = 0;
            for (
                uint256 i = currentPosition;
                i < leadershipPositionsReward.length;
                i++
            ) {
                LeadershipInfo memory pos = leadershipPositionsReward[i];
                if (referrerUserInfo.leadershipScore < pos.sales) {
                    break;
                }
                points = points.add(pos.reward);
                currentPosition = currentPosition.add(1);
            }
            referrerUserInfo.currentLeadershipPosition = currentPosition;
            referrerUserInfo.referralDebt = referrerUserInfo.referralDebt.add(points);
            userInfo[referrerInfo.referrer] = referrerUserInfo;
        }
        if (
            referrerInfo.referrer != address(0) &&
            referrerInfo.initialReward == false
        ) {
            uint256 commision = calcReferralReward(_transactionAmount);
            if (commision > 0) {
                totalReferralCommissions[referrerInfo.referrer] += commision;
                referrerInfo.initialReward = true;
                referrers[_user] = referrerInfo;

                UserInfo memory referrerUserInfo = userInfo[
                    referrerInfo.referrer
                ];
                referrerUserInfo.referralDebt = referrerUserInfo.referralDebt.add(commision);
                userInfo[referrerInfo.referrer] = referrerUserInfo;

                emit ReferralCommissionRecorded(
                    referrerInfo.referrer,
                    commision
                );
                emit ReferralCommissionPaid(
                    _user,
                    referrerInfo.referrer,
                    commision
                );
            }
        }
    }

    function enableEmergencyWithdrawal(bool _enable) public onlyOwner {
        emergencyWidthdrawal = _enable;
    }
}
