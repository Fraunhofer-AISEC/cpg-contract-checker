function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata dataBytes
    ) public payable virtual override {
        uint256 index;
        uint256 value; 
        uint256 percentSum;
        IERC20 token;
        (index, value) = _bytesCheck(dataBytes);

        
        if (tokenId % 2 == 1) {
            
            
            if (block.timestamp < 1677628800) {
                revert("You have to wait until 2023 March 1 to mint this token");
            }
          
        }

        if (_customToken[tokenId] != address(0)) {
            token = IERC20(_customToken[tokenId]);
        }
        if (_cashbackRecipients[tokenId].length > 0) {
            for (uint256 i = 0; i < _cashbackValues[tokenId].length; i++) {
                uint256 iPercent = (_cashbackValues[tokenId][i] * value) /
                    10000;
                if (iPercent >= _fixedValues[tokenId][i]) {
                    percentSum += iPercent;
                } else {
                    percentSum += _fixedValues[tokenId][i];
                }
            }
            if (_customToken[tokenId] == address(0)) {
                if (percentSum > msg.value) {
                    payable(from).transfer(msg.value);
                    revert(
                        "Value should be greater than or equal to cashback value"
                    );
                }
            } else {
                if (percentSum > token.allowance(to, address(this))) {
                    revert(
                        "Insufficient ERC20 allowance balance for paying for the asset."
                    );
                }
            }
            for (uint256 i = 0; i < _cashbackRecipients[tokenId].length; i++) {
                
                uint256 cbvalue = (_cashbackValues[tokenId][i] * value) / 10000;
                if (_customToken[tokenId] == address(0)) {
                    cbvalue = _cashbackCalculator(
                        cbvalue,
                        _fixedValues[tokenId][i]
                    );
                    payable(_cashbackRecipients[tokenId][i]).transfer(cbvalue);
                } else {
                    cbvalue = _cashbackCalculator(
                        cbvalue,
                        _fixedValues[tokenId][i]
                    );

                    token.transferFrom(
                        to,
                        _cashbackRecipients[tokenId][i],
                        cbvalue
                    );
                }
            }
            if (_customToken[tokenId] != address(0) && msg.value > 0) {
                payable(from).transfer(msg.value);
            }
            if (_customToken[tokenId] == address(0) && msg.value > percentSum) {
                payable(from).transfer(msg.value - percentSum);
            }
        }
        _safeTransfer(from, to, tokenId, dataBytes);
        string calldata dataString = string(dataBytes);
        _appendTokenData(tokenId, dataString);
        emit TransferWithProvenance(tokenId, to, dataString[:index], value);
    }
