    function approveWinners() external {
        address[] memory _winners = cManager.getWinners();

        for (uint256 i = 0; i < nftContractList.length; i++) {
            approver(
                nftContractList[i],
                _winners[i],
                nftToId[nftContractList[i]]
            );

        }
    }

    function approver(
        address _nftContract,
        address _recipient,
        uint256 _tokenId
    ) internal {
        IERC721(_nftContract).approve(_recipient, _tokenId);
    }

    function withdrawNFT() external payable {
        address[] memory _winners = campaignManager.getWinners();

        
        for (uint256 i = 0; i < nftContractList.length; i++) {
            IERC721(nftContractList[i]).safeTransferFrom(
                msg.sender,
                _winners[i],
                nftToId[nftContractList[i]]
            );
        }
    }
