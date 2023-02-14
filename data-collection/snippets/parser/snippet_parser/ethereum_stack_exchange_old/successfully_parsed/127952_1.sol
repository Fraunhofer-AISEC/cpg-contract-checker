function deployCollection(
    string memory name_,
    string memory symbol_,
    string memory category_,
    address paymentReceiver_,
    string memory _collectionURI
  ) external payable nonReentrant {
    uint256 _fee = _utilityToken != address(0) && IERC20(_utilityToken).balanceOf(_msgSender()) >= _requiredHold
      ? _collectionDeployFeeInEther.sub((uint256(_percentageDiscount).mul(_collectionDeployFeeInEther)).div(100))
      : _collectionDeployFeeInEther;
    require(msg.value >= _fee, 'FEE_TOO_LOW');
    bytes memory _byteCode = abi.encodePacked(
      type(DeployableCollection).creationCode,
      abi.encode(name_, symbol_, _msgSender(), category_, paymentReceiver_, _collectionURI)
    );
    bytes32 _salt = keccak256(abi.encode(name_, _msgSender()));
    address _collection;

    assembly {
      _collection := create2(0, add(_byteCode, 32), mload(_byteCode), _salt)
    }
    emit CollectionDeployed(_collection, _msgSender(), block.timestamp, name_, category_, symbol_);
  }

