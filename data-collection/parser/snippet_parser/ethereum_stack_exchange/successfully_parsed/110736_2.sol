contract TimedCrowdsale is Crowdsale {     

uint256 private _openingTime;
    uint256 private _closingTime;

modifier onlyWhileOpen {
        require(isOpen(), "TimedCrowdsale: not open");
        _;
    }

function isOpen() public view returns (bool) {
        
        return block.timestamp >= _openingTime && block.timestamp <= _closingTime;
    }

 function _preValidatePurchase(address beneficiary, uint256 weiAmount) internal onlyWhileOpen view {
        super._preValidatePurchase(beneficiary, weiAmount);
    }

}
