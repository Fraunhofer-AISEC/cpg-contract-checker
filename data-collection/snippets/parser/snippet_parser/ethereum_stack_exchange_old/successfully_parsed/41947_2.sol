pragma solidity ^0.4.20;

import "./Moderated.sol";
import "./SafeMath.sol";
import "./ABCD.sol";

contract CrowdSale is Moderated {
    using SafeMath for uint256;

    
    ABCD public tokenContract;

    uint256 public startDate;

    uint256 public endDate;

    
    uint256 public constant crowdsaleTarget = 2705 ether;
    
    uint256 public etherRaised;

    
    address public etherVault;

    
    uint256 constant purchaseThreshold = 5 finney;

    
    bool public isFinalized = false;

    bool public active = false;

    
    event Finalized();

    
    event Purchased(address indexed purchaser, uint256 indexed tokens);

    
    modifier onlyWhileActive {
        require(now >= startDate && now <= endDate && active);
        _;
    }

    function CrowdSale( address _tokenAddr,
                        uint256 start,
                        uint256 end) public {
        require(_tokenAddr != address(0x0));
        require(now < start && start < end);
        
        tokenContract = ABCD(_tokenAddr);

        etherVault = msg.sender;

        startDate = start;
        endDate = end;
    }

    
    function () external payable {
        buyTokens(msg.sender);
    }

    function buyTokens(address _purchaser) public payable ifUnrestricted onlyWhileActive returns (bool) {
        require(!targetReached());
        require(msg.value > purchaseThreshold);
        etherVault.transfer(msg.value);

        uint256 _tokens = calculate(msg.value);
        
        require(tokenContract.transferFrom(moderator,_purchaser,_tokens));
        
        Purchased(_purchaser, _tokens);
        return true;
    }

    function calculate(uint256 weiAmount) internal returns(uint256) {
        uint256 excess;
        uint256 numTokens;
        uint256 excessTokens;
        if(etherRaised < 5 ether) {
            etherRaised = etherRaised.add(weiAmount);
            if(etherRaised > 5 ether) {
                excess = etherRaised.sub(5 ether);
                numTokens = weiAmount.sub(excess).mul(100000);
                etherRaised = etherRaised.sub(excess);
                excessTokens = calculate(excess);
                return numTokens + excessTokens;
            } else {
                return weiAmount.mul(100000);
            }
        } else if(etherRaised < 55 ether) {
            etherRaised = etherRaised.add(weiAmount);
            if(etherRaised > 55 ether) {
                excess = etherRaised.sub(55 ether);
                numTokens = weiAmount.sub(excess).mul(10000);
                etherRaised = etherRaised.sub(excess);
                excessTokens = calculate(excess);
                return numTokens + excessTokens;
            } else {
                return weiAmount.mul(10000);
            }
        } else if(etherRaised < 155 ether) {
            etherRaised = etherRaised.add(weiAmount);
            if(etherRaised > 155 ether) {
                excess = etherRaised.sub(155 ether);
                numTokens = weiAmount.sub(excess).mul(5000);
                etherRaised = etherRaised.sub(excess);
                excessTokens = calculate(excess);
                return numTokens + excessTokens;
            } else {
                return weiAmount.mul(5000);
            }
        } else if(etherRaised < 905 ether) {
            etherRaised = etherRaised.add(weiAmount);
            if(etherRaised > 905 ether) {
                excess = etherRaised.sub(905 ether);
                numTokens = weiAmount.sub(excess).mul(3333);
                etherRaised = etherRaised.sub(excess);
                excessTokens = calculate(excess);
                return numTokens + excessTokens;
            } else {
                return weiAmount.mul(3333);
            }
        } else if(etherRaised < 1705 ether) {
            etherRaised = etherRaised.add(weiAmount);
            if(etherRaised > 1705) {
                excess = etherRaised.sub(1705 ether);
                numTokens = weiAmount.sub(excess).mul(2500);
                etherRaised = etherRaised.sub(excess);
                excessTokens = calculate(excess);
                return numTokens + excessTokens;
            } else {
                return weiAmount.mul(2500);
            }
        } else {
            etherRaised = etherRaised.add(weiAmount);
            return weiAmount.mul(2000);
        }
    }

    function changeEtherVault(address newEtherVault) public onlyModerator {
        require(newEtherVault != address(0x0));
        etherVault = newEtherVault;
    }

    function initialize() public onlyModerator {
        
        
        require(tokenContract.allowance(moderator, address(this)) == 8000000000000000000000000);
        active = true;
        
        
    }

    
    function finalize() public onlyModerator {
        
        require(!isFinalized);
        
        require(hasEnded() || targetReached());

        active = false;

        
        Finalized();
        
        isFinalized = true;
    }

    
    function hasEnded() internal view returns (bool) {
        return (now > endDate);
    }

    
    function targetReached() internal view returns (bool) {
        return (etherRaised >= crowdsaleTarget);
    }
}
