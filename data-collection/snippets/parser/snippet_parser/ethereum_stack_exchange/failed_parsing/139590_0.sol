 function _withdrawPairNft(uint256 mainTypePoolId, PairNftWithAmount[] calldata _nfts) private {
        for(uint256 i; i < _nfts.length; ++i) {
            uint256 mainTokenId = _nfts[i].mainTokenId;
            uint256 bbbcTokenId = _nfts[i].bbbcTokenId;
            uint256 amount = _nfts[i].amount;
            address mainTokenOwner = nftContracts[mainTypePoolId].ownerOf(mainTokenId);
            address bbbcOwner = nftContracts[BBBC_POOL_ID].ownerOf(bbbcTokenId);
            PairingStatus memory mainToSecond = mainToBbbc[mainTypePoolId][mainTokenId];
            PairingStatus memory secondToMain = bbbcToMain[bakcTokenId][mainTypePoolId];

            require(mainTokenOwner == msg.sender || bbbcOwner == msg.sender, "At least one token in pair must be owned by caller");
            require(mainToSecond.tokenId == bbbcTokenId && mainToSecond.isPaired
                && secondToMain.tokenId == mainTokenId && secondToMain.isPaired, "The provided Token IDs are not paired");

            Position storage position = nftPosition[BBBC_POOL_ID][bbbcTokenId];
            require(mainTokenOwner == bbbcOwner || amount == position.stakedAmount, "Split pair can't partially withdraw");

            if (amount == position.stakedAmount) {
                uint256 rewardsToBeClaimed = _claim(BBBC_POOL_ID, position, bbbcOwner);
                mainToBbbc[mainTypePoolId][mainTokenId] = PairingStatus(0, false);
                bbbcToMain[bbbcTokenId][mainTypePoolId] = PairingStatus(0, false);
                emit ClaimRewardsPairNft(msg.sender, rewardsToBeClaimed, mainTypePoolId, mainTokenId, bbbcTokenId);
            }
            _withdraw(BBBC_POOL_ID, position, amount, mainTokenOwner);
            emit WithdrawPairNft(msg.sender, amount, mainTypePoolId, mainTokenId, bbbcTokenId);
