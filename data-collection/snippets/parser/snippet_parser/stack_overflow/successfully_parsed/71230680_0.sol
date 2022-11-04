IERC20 diamond;

function upgradePre(
        uint256 recordNo,
        uint256 tokenType,
        uint256 tokenId,
        uint256 expireTime,
        uint256 diamondquantity
    ) public payable {
        
        require(expireTime >= block.timestamp, "request expired");
        
        require(!orders[recordNo].isCompletePre, "repeat transaction");
        
        require(
            msg.sender == _getOwnerByTokenIdAndTokenType(tokenId, tokenType),
            "owner exception"
        );
        
        uint256 currentLevel = _getLevelByTokenIdAndTokenType(
            tokenId,
            tokenType
        );

        UpgradeConfItem memory upgradeConfItem = _getUpradeConf(tokenId, tokenType, currentLevel + 1);
        
        require(upgradeConfItem.diamondquantity > 0 && diamondquantity >= upgradeConfItem.diamondquantity, "diamondquantity too small");
        require(
            diamond.balanceOf(msg.sender) >= diamondquantity,
            "Insufficient balance"
        );
        require(
            (diamond.allowance(msg.sender, address(this)) >= (diamondquantity)),
            "0xSUB: Allowance required"
        );
        require(
            diamond.transferFrom(msg.sender, receiveAddress, diamondquantity),
            "payment failed"
        );

        
        _initUpgradeOrder(recordNo, tokenId, tokenType, currentLevel);
        
        logService.requestRandomNum(1, recordNo);
        
        _logUpgradePre(
            recordNo,
            tokenId,
            tokenType,
            diamondquantity,
            currentLevel
        );
    }
