uint256 public constant HARDCAP = 1 ether; 

function _buyTokens(address beneficiary) internal {
        uint256 weiToHardcap = HARDCAP.sub(weiRaised);
        uint256 weiAmount = weiToHardcap < msg.value ? weiToHardcap : msg.value;

        _buyTokens(beneficiary, weiAmount);

        uint256 refund = msg.value.sub(weiAmount);
        if (refund > 0) {
            payable(beneficiary).transfer(refund);
        }
    }
