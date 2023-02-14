function _getCreationFee(string memory merchantName) internal view returns (uint256) {
            uint8 nameLength = uint8(bytes(merchantName).length);
            if (nameLength == 3) {
                return baseMerchantFee * veryShortNameMultiplier;
            } else if (nameLength == 4) {
                return baseMerchantFee * shortNameMultiplier;
            } else {
                return baseMerchantFee;
            }
        }
