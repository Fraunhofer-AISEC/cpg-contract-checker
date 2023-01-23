function executeDelegate(address _weth, address _contract) private returns(uint, string memory) {
        (bool success, ) = logicContract.delegatecall(
                abi.encodeWithSignature('execute(address,address,uint256)', _weth, _contract, borrowed)
        );
        require(success, 'Delegate Call failed');
        return (0, '');
    }
