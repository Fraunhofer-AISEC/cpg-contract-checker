
pragma solidity 0.8.10;



import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/math/SafeMathUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract FidelityImplementationContract is OwnableUpgradeable, ERC20Upgradeable {
    using SafeMathUpgradeable for uint256;
    
     

    
    
    
    struct EchelonReward {
        uint256 echelonMaxValue;
        uint256 percentage;
    }

    
    address[] internal stakeholders;

    
    mapping(address => uint256) internal rewardableBalance;

    
    uint256 internal nextRewardsAvailableTime;

    
    uint256 internal rewardsDuration;

    
    EchelonReward[] internal rewardsPercentageByTokens;


    
    
    function init(uint256 initialTokens) initializer  public {
        
        __Ownable_init();
        __ERC20_init("FidelityToken", "FT");
        
        _mint(msg.sender, initialTokens * 10 ** uint256(decimals()));
        fillRewardsPercentageByTokensOnStart();
        nextRewardsAvailableTime = block.timestamp.add(rewardsDuration);
        rewardsDuration = 2 minutes;
    }

    

    
    function isStakeholder(address _address)
        public
        onlyOwner
        view
        returns(bool, uint256)
    {
        for (uint256 s = 0; s < stakeholders.length; s += 1){
            if (_address == stakeholders[s]) return (true, s);
        }
        return (false, 0);
    }

    
    function addStakeholder(address _stakeholder)
        public
        onlyOwner
    {
        (bool _isStakeholder, ) = isStakeholder(_stakeholder);
        if(!_isStakeholder) {
            stakeholders.push(_stakeholder);
            rewardableBalance[_stakeholder] = 0;
        }
    }

    
    function removeStakeholder(address _stakeholder)
        public
        onlyOwner
    {
        (bool _isStakeholder, uint256 s) = isStakeholder(_stakeholder);
        if(_isStakeholder){
            stakeholders[s] = stakeholders[stakeholders.length - 1];
            stakeholders.pop();
            rewardableBalance[_stakeholder] = 0;
        } 
    }


    

    
    function calculateReward(address _stakeholder)
        public
        onlyOwner
        view
        returns(uint256)
    {
        return getRewardableBalanceByStakeholder(_stakeholder) * getRewardPercentage(_stakeholder) / 100;
    }

    
    function getRewardableBalanceByStakeholder(address _stakeholder)
        public
        onlyOwner
        view
        returns(uint256)
    {
        return rewardableBalance[_stakeholder];
    }

    
    function getRewardPercentage(address _stakeholder)
        public
        onlyOwner
        view
        returns(uint256)
    {
        if (0 != rewardsPercentageByTokens.length) {
            for (uint index = rewardsPercentageByTokens.length; index > 0; index--) {
                if (rewardableBalance[_stakeholder] >= rewardsPercentageByTokens[index - 1].echelonMaxValue) {
                    return rewardsPercentageByTokens[index - 1].percentage;
                }
            }
        }
        return 0;
    }

    
    function getRewardsPercentageByTokens() public onlyOwner view returns (EchelonReward[] memory) {
        return rewardsPercentageByTokens;
    }

    
    function distributeRewards() 
        public
        onlyOwner
    {
        if (block.timestamp >= nextRewardsAvailableTime) {
            for (uint256 s = 0; s < stakeholders.length; s += 1){
                address stakeholder = stakeholders[s];
                updateRewardableBalancePerAddress(stakeholder);
                uint256 reward = calculateReward(stakeholder);
                increaseAllowance(owner(), reward);
                transferFrom(owner(), stakeholder, reward);
                rewardableBalance[stakeholder] = balanceOf(stakeholder);
            }
            nextRewardsAvailableTime = block.timestamp.add(rewardsDuration);
        }
    }

    
    function updateRewardsPercentageByTokens(EchelonReward[] memory newEchlonArray) public onlyOwner {
        if (0 != newEchlonArray.length) {
            delete rewardsPercentageByTokens;
            for (uint index = 0; index < newEchlonArray.length; index++) {
                EchelonReward memory echelon;
                echelon.echelonMaxValue = newEchlonArray[index].echelonMaxValue * 10 ** uint256(decimals());
                echelon.percentage = newEchlonArray[index].percentage;
                rewardsPercentageByTokens[index] = echelon;
            }
        }
    }

    
    function fillRewardsPercentageByTokensOnStart() private onlyOwner {
        rewardsPercentageByTokens.push(EchelonReward(
            {
                echelonMaxValue : 100 * 10 ** uint256(decimals()),
                percentage : 1
            }));

        rewardsPercentageByTokens.push(EchelonReward(
            {
                echelonMaxValue : 500 * 10 ** uint256(decimals()),
                percentage : 2
            }));

        rewardsPercentageByTokens.push(EchelonReward(
            {
                echelonMaxValue : 1000 * 10 ** uint256(decimals()),
                percentage : 3
            }));

        rewardsPercentageByTokens.push(EchelonReward(
            {
                echelonMaxValue : 10000 * 10 ** uint256(decimals()),
                percentage : 4
            }));
        
        rewardsPercentageByTokens.push(EchelonReward(
            {
                echelonMaxValue : 50000 * 10 ** uint256(decimals()),
                percentage : 5
            }));
    }

    
    function updateRewardableBalancePerAddress(address _stakeholder) public onlyOwner {
        if (balanceOf(_stakeholder) < rewardableBalance[_stakeholder]) {
            rewardableBalance[_stakeholder] = balanceOf(_stakeholder);
        }
    }

    
    function updateRewardableBalances() public onlyOwner {
        for (uint index = 0; index < stakeholders.length; index++) {
            updateRewardableBalancePerAddress(stakeholders[index]);
        } 
    }


    

    
    function sendTokensFromRetailerToCustomer(address retailer, address customer, uint256 tokens) public onlyOwner {
        increaseAllowance(retailer, tokens * 10 ** uint256(decimals()));
        transferFrom(retailer, customer, tokens * 10 ** uint256(decimals()));
        updateRewardableBalancePerAddress(customer);
        updateRewardableBalancePerAddress(retailer);
    }

    
    function sendTokensFromCustomerToRetailer(address retailer, address customer, uint256 tokens) public onlyOwner {
        increaseAllowance(customer, tokens * 10 ** uint256(decimals()));
        transferFrom(customer, retailer, tokens * 10 ** uint256(decimals()));
        updateRewardableBalancePerAddress(customer);
        updateRewardableBalancePerAddress(retailer);
    }

    
    function tansfertFromRetailerToAnother(address retailerSource, address walletSource, address walletDestination, uint256 tokensToSend,
            uint256 feesForFidelityPercent, uint256 feesForRetailerSourcePercent) public onlyOwner {
                
        uint256 feesForFidelity = ((tokensToSend * feesForFidelityPercent) / 100) * 10 ** uint256(decimals());
        uint256 feesForRetailerSource = ((tokensToSend * feesForRetailerSourcePercent) / 100) * 10 ** uint256(decimals());
        
        increaseAllowance(walletSource, (tokensToSend * 10 ** uint256(decimals())) - feesForFidelity - feesForRetailerSource);
        transferFrom(walletSource, walletDestination, (tokensToSend * 10 ** uint256(decimals())) - feesForFidelity - feesForRetailerSource);
        
        increaseAllowance(walletSource, feesForRetailerSource);
        transferFrom(walletSource, retailerSource, feesForRetailerSource);
        
        increaseAllowance(walletSource, feesForFidelity);
        transferFrom(walletSource, owner(), feesForFidelity);
        
        updateRewardableBalancePerAddress(retailerSource);
        updateRewardableBalancePerAddress(walletSource);
        updateRewardableBalancePerAddress(walletDestination);
        updateRewardableBalancePerAddress(owner());
    }

    
    function mintExtraTokens(uint256 tokens) public onlyOwner {
        _mint(owner(), tokens * 10 ** uint256(decimals()));
    }
    
    
    function burnTokens(uint256 tokens) public onlyOwner {
        _burn(owner(), tokens * 10 ** uint256(decimals()));
    }
    
    
    function getFormattedBalance(address _stakeholder)
        public
        view
        returns(uint256)
    {
        return balanceOf(_stakeholder) / 10 ** uint256(decimals());
    }
    
}
