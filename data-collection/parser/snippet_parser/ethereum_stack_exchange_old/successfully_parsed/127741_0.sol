function _preValidatePurchase(address beneficiary, uint256 weiAmount) internal view {
        require(beneficiary != address(0), "Crowdsale: beneficiary is the zero address");
        require(weiAmount != 0, "Crowdsale: weiAmount is 0");
        require(weiAmount >= minPurchase, 'have to send at least: minPurchase');
        require(_contributions[beneficiary].add(weiAmount)<= maxPurchase, 'can\'t buy more than: maxPurchase');
        require((_weiRaised+weiAmount) <= hardCap, 'Hard Cap reached');
        this; 
    } 
