
  function mintNFT(
    address collection,
    string memory tokenURI_,
    address _for
  ) external payable nonReentrant returns (bool) {
    uint256 _fee = _utilityToken != address(0) && IERC20(_utilityToken).balanceOf(_msgSender()) >= _requiredHold
      ? _mintFeeInEther.sub((uint256(_percentageDiscount).mul(_mintFeeInEther)).div(100))
      : _mintFeeInEther;

    require(msg.value >= _fee, 'FEE_TOO_LOW');

    address _paymentReceiver = IDeployableCollection(collection)._paymentReceiver();
    uint256 _feeForOwner = (uint256(_percentageForCollectionOwners).mul(_fee)).div(100);

    _safeMintFor(collection, tokenURI_, _for);
    _safeTransferETH(_paymentReceiver, _feeForOwner);

    uint256 _tokenId = IDeployableCollection(collection).lastMintedForIDs(_msgSender());
    emit Mint(collection, _tokenId, block.timestamp, tokenURI_, _msgSender());
    return true;
  }
