function onERC721Received(address _operator, address _from, uint256 _tokenId, bytes calldata _data) external returns(bytes4){
        (address _distributionAddress, 
            address _paymentAddress,
            address _taxAddress, 
            uint256 _erc20Supply,
            string memory _erc20Name, 
            string memory _erc20Symbol, 
            uint _erc20Decimals,
            uint _minimumShares, 
            bytes memory _deploymentData) = abi.decode(_data, (
                address, 
                address,
                address, 
                uint256, 
                string, 
                string, 
                uint, 
                uint,
                bytes));
        require(lock721Token(_operator, _distributionAddress, _paymentAddress, _taxAddress, _tokenId, _erc20Supply, _erc20Name, _erc20Symbol, _erc20Decimals, _minimumShares, _deploymentData) == true);
        return bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"));
    }

    function lock721Token (
        address _tokenToLockAddress, 
        address _distributionAddress, 
        address _paymentAddress,
        address _taxAddress,
        uint256 _tokenToLockId, 
        uint256 _erc20Supply, 
        string memory _erc20Name, 
        string memory _erc20Symbol, 
        uint _erc20Decimals,
        uint _minimumShares,   
        bytes memory _deploymentData) private returns(bool)
    {
        TokenToLock memory _tokenToLock = TokenToLock(_tokenToLockAddress, _tokenToLockId);
        locked721Tokens.push(_tokenToLock); 
        AssetTokenizationContract newAssetTokenizationContract = new AssetTokenizationContract(_tokenToLockAddress, _distributionAddress, _paymentAddress, _taxAddress, _tokenToLockId, _erc20Supply, _erc20Name, _erc20Symbol, _erc20Decimals, _minimumShares, _deploymentData);
        ERC20ToToken[address(newAssetTokenizationContract)] = _tokenToLock;

        bytes32 _tokenToLockHash = abi.encode(keccak256(addressToString(_tokenToLockAddress), _tokenToLockId));
        tokenToERC20[_tokenToLockHash] = address(newAssetTokenizationContract);
        return true;
    }
