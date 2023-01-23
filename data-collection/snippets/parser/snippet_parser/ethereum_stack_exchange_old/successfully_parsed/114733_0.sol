

pragma solidity 0.6.12;

import "./SafeMath.sol";
import "./IBEP20.sol";
import "./SafeBEP20.sol";
import "./IReferral.sol";
import "./Ownable.sol";
import "./ReentrancyGuard.sol";

import "./Narfex.sol";








contract MasterChef is Ownable, ReentrancyGuard {
    using SafeMath for uint256;
    using SafeBEP20 for IBEP20;

    
    struct UserInfo {
        uint256 amount;         
        uint256 rewardDebt;     
        uint256 rewardLockedUp;  
        uint256 nextHarvestUntil; 
        
        
        
        
        
        
        
        
        
        
        
    }

    
    struct PoolInfo {
        IBEP20 lpToken;           
        uint256 allocPoint;       
        uint256 lastRewardBlock;  
        uint256 accNarfexPerShare;   
        uint16 depositFeeBP;      
        uint256 harvestInterval;  
    }

    
    NarfexToken public NRFX;
    
    address public devAddress;
    
    address public feeAddress;
    
    uint256 public NarfexPerBlock;
    
    uint256 public constant BONUS_MULTIPLIER = 1;
    
    uint256 public constant MAXIMUM_HARVEST_INTERVAL = 14 days;

    
    PoolInfo[] public poolInfo;
    
    mapping(uint256 => mapping(address => UserInfo)) public userInfo;
    
    uint256 public totalAllocPoint = 0;
    
    uint256 public startBlock;
    
    uint256 public totalLockedUpRewards;

    
    INarfexReferral public NarfexReferral;
    
    uint16 public referralCommissionRate = 100;
    
    uint16 public constant MAXIMUM_REFERRAL_COMMISSION_RATE = 1000;

    event Deposit(address indexed user, uint256 indexed pid, uint256 amount);
    event Withdraw(address indexed user, uint256 indexed pid, uint256 amount);
    event EmergencyWithdraw(address indexed user, uint256 indexed pid, uint256 amount);
    event EmissionRateUpdated(address indexed caller, uint256 previousAmount, uint256 newAmount);
    event ReferralCommissionPaid(address indexed user, address indexed referrer, uint256 commissionAmount);
    event RewardLockedUp(address indexed user, uint256 indexed pid, uint256 amountLockedUp);

    constructor(
        NarfexToken _Narfex,
        uint256 _startBlock,
        uint256 _NarfexPerBlock
    ) public {
        Narfex = _Narfex;
        startBlock = _startBlock;
        NarfexPerBlock = _NarfexPerBlock;

        devAddress = msg.sender;
        feeAddress = msg.sender;
    }

    function poolLength() external view returns (uint256) {
        return poolInfo.length;
    }

    
    
    function add(uint256 _allocPoint, IBEP20 _lpToken, uint16 _depositFeeBP, uint256 _harvestInterval, bool _withUpdate) public onlyOwner {
        require(_depositFeeBP <= 10000, "add: invalid deposit fee basis points");
        require(_harvestInterval <= MAXIMUM_HARVEST_INTERVAL, "add: invalid harvest interval");
        if (_withUpdate) {
            massUpdatePools();
        }
        uint256 lastRewardBlock = block.number > startBlock ? block.number : startBlock;
        totalAllocPoint = totalAllocPoint.add(_allocPoint);
        poolInfo.push(PoolInfo({
            lpToken: _lpToken,
            allocPoint: _allocPoint,
            lastRewardBlock: lastRewardBlock,
            accNarfexPerShare: 0,
            depositFeeBP: _depositFeeBP,
            harvestInterval: _harvestInterval
        }));
    }

    
    function set(uint256 _pid, uint256 _allocPoint, uint16 _depositFeeBP, uint256 _harvestInterval, bool _withUpdate) public onlyOwner {
        require(_depositFeeBP <= 10000, "set: invalid deposit fee basis points");
        require(_harvestInterval <= MAXIMUM_HARVEST_INTERVAL, "set: invalid harvest interval");
        if (_withUpdate) {
            massUpdatePools();
        }
        totalAllocPoint = totalAllocPoint.sub(poolInfo[_pid].allocPoint).add(_allocPoint);
        poolInfo[_pid].allocPoint = _allocPoint;
        poolInfo[_pid].depositFeeBP = _depositFeeBP;
        poolInfo[_pid].harvestInterval = _harvestInterval;
    }

    
    function getMultiplier(uint256 _from, uint256 _to) public pure returns (uint256) {
        return _to.sub(_from).mul(BONUS_MULTIPLIER);
    }

    
    function pendingNarfex(uint256 _pid, address _user) external view returns (uint256) {
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][_user];
        uint256 accNarfexPerShare = pool.accNarfexPerShare;
        uint256 lpSupply = pool.lpToken.balanceOf(address(this));
        if (block.number > pool.lastRewardBlock && lpSupply != 0) {
            uint256 multiplier = getMultiplier(pool.lastRewardBlock, block.number);
            uint256 NarfexReward = multiplier.mul(NarfexPerBlock).mul(pool.allocPoint).div(totalAllocPoint);
            accNarfexPerShare = accNarfexPerShare.add(NarfexReward.mul(1e12).div(lpSupply));
        }
        uint256 pending = user.amount.mul(accNarfexPerShare).div(1e12).sub(user.rewardDebt);
        return pending.add(user.rewardLockedUp);
    }

    
    function canHarvest(uint256 _pid, address _user) public view returns (bool) {
        UserInfo storage user = userInfo[_pid][_user];
        return block.timestamp >= user.nextHarvestUntil;
    }

    
    function massUpdatePools() public {
        uint256 length = poolInfo.length;
        for (uint256 pid = 0; pid < length; ++pid) {
            updatePool(pid);
        }
    }

    
    function updatePool(uint256 _pid) public {
        PoolInfo storage pool = poolInfo[_pid];
        if (block.number <= pool.lastRewardBlock) {
            return;
        }
        uint256 lpSupply = pool.lpToken.balanceOf(address(this));
        if (lpSupply == 0 || pool.allocPoint == 0) {
            pool.lastRewardBlock = block.number;
            return;
        }
        uint256 multiplier = getMultiplier(pool.lastRewardBlock, block.number);
        uint256 NarfexReward = multiplier.mul(NarfexPerBlock).mul(pool.allocPoint).div(totalAllocPoint);
        Narfex.mint(devAddress, NarfexReward.div(10));
        Narfex.mint(address(this), NarfexReward);
        pool.accNarfexPerShare = pool.accNarfexPerShare.add(NarfexReward.mul(1e12).div(lpSupply));
        pool.lastRewardBlock = block.number;
    }

    
    function deposit(uint256 _pid, uint256 _amount, address _referrer) public nonReentrant {
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][msg.sender];
        updatePool(_pid);
        if (_amount > 0 && address(NarfexReferral) != address(0) && _referrer != address(0) && _referrer != msg.sender) {
            NarfexReferral.recordReferral(msg.sender, _referrer);
        }
        payOrLockupPendingNarfex(_pid);
        if (_amount > 0) {
            pool.lpToken.safeTransferFrom(address(msg.sender), address(this), _amount);
            if (address(pool.lpToken) == address(Narfex)) {
                uint256 transferTax = _amount.mul(Narfex.transferTaxRate()).div(10000);
                _amount = _amount.sub(transferTax);
            }
            if (pool.depositFeeBP > 0) {
                uint256 depositFee = _amount.mul(pool.depositFeeBP).div(10000);
                pool.lpToken.safeTransfer(feeAddress, depositFee);
                user.amount = user.amount.add(_amount).sub(depositFee);
            } else {
                user.amount = user.amount.add(_amount);
            }
        }
        user.rewardDebt = user.amount.mul(pool.accNarfexPerShare).div(1e12);
        emit Deposit(msg.sender, _pid, _amount);
    }

    
    function withdraw(uint256 _pid, uint256 _amount) public nonReentrant {
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][msg.sender];
        require(user.amount >= _amount, "withdraw: not good");
        updatePool(_pid);
        payOrLockupPendingNarfex(_pid);
        if (_amount > 0) {
            user.amount = user.amount.sub(_amount);
            pool.lpToken.safeTransfer(address(msg.sender), _amount);
        }
        user.rewardDebt = user.amount.mul(pool.accNarfexPerShare).div(1e12);
        emit Withdraw(msg.sender, _pid, _amount);
    }

    
    function emergencyWithdraw(uint256 _pid) public nonReentrant {
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][msg.sender];
        uint256 amount = user.amount;
        user.amount = 0;
        user.rewardDebt = 0;
        user.rewardLockedUp = 0;
        user.nextHarvestUntil = 0;
        pool.lpToken.safeTransfer(address(msg.sender), amount);
        emit EmergencyWithdraw(msg.sender, _pid, amount);
    }

    
    function payOrLockupPendingNarfex(uint256 _pid) internal {
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][msg.sender];

        if (user.nextHarvestUntil == 0) {
            user.nextHarvestUntil = block.timestamp.add(pool.harvestInterval);
        }

        uint256 pending = user.amount.mul(pool.accNarfexPerShare).div(1e12).sub(user.rewardDebt);
        if (canHarvest(_pid, msg.sender)) {
            if (pending > 0 || user.rewardLockedUp > 0) {
                uint256 totalRewards = pending.add(user.rewardLockedUp);

                
                totalLockedUpRewards = totalLockedUpRewards.sub(user.rewardLockedUp);
                user.rewardLockedUp = 0;
                user.nextHarvestUntil = block.timestamp.add(pool.harvestInterval);

                
                safeNRFXransfer(msg.sender, totalRewards);
                payReferralCommission(msg.sender, totalRewards);
            }
        } else if (pending > 0) {
            user.rewardLockedUp = user.rewardLockedUp.add(pending);
            totalLockedUpRewards = totalLockedUpRewards.add(pending);
            emit RewardLockedUp(msg.sender, _pid, pending);
        }
    }

    
    function safeNarfexTransfer(address _to, uint256 _amount) internal {
        uint256 NarfexBal = Narfex.balanceOf(address(this));
        if (_amount > NarfexBal) {
            Narfex.transfer(_to, NarfexBal);
        } else {
            Narfex.transfer(_to, _amount);
        }
    }

    
    function setDevAddress(address _devAddress) public {
        require(msg.sender == devAddress, "setDevAddress: FORBIDDEN");
        require(_devAddress != address(0), "setDevAddress: ZERO");
        devAddress = _devAddress;
    }

    function setFeeAddress(address _feeAddress) public {
        require(msg.sender == feeAddress, "setFeeAddress: FORBIDDEN");
        require(_feeAddress != address(0), "setFeeAddress: ZERO");
        feeAddress = _feeAddress;
    }

    
    function updateEmissionRate(uint256 _NarfexPerBlock) public onlyOwner {
        massUpdatePools();
        emit EmissionRateUpdated(msg.sender, NarfexPerBlock, _NarfexPerBlock);
        NRFXPerBlock = _NRFXPerBlock;
    }

    
    function setNarfexReferral(INarfexReferral _NarfexReferral) public onlyOwner {
        NarfexReferral = _NarfexReferral;
    }

    
    function setReferralCommissionRate(uint16 _referralCommissionRate) public onlyOwner {
        require(_referralCommissionRate <= MAXIMUM_REFERRAL_COMMISSION_RATE, "setReferralCommissionRate: invalid referral commission rate basis points");
        referralCommissionRate = _referralCommissionRate;
    }

    
    function payReferralCommission(address _user, uint256 _pending) internal {
        if (address(NarfexReferral) != address(0) && referralCommissionRate > 0) {
            address referrer = NarfexReferral.getReferrer(_user);
            uint256 commissionAmount = _pending.mul(referralCommissionRate).div(10000);

            if (referrer != address(0) && commissionAmount > 0) {
                Narfex.mint(referrer, commissionAmount);
                NarfexReferral.recordReferralCommission(referrer, commissionAmount);
                emit ReferralCommissionPaid(_user, referrer, commissionAmount);
            }
        }
    }
}
