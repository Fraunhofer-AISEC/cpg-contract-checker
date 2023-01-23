function checkUpkeep(bytes memory ) public view override returns (
        bool upkeepNeeded, 
        bytes memory num
        ){

        uint256 EthPrice = 0;
        
        EthPrice = getPrice();
        num = abi.encodePacked(EthPrice);
        if (EthPrice > 0){
            upkeepNeeded = true;
        }

        return (upkeepNeeded, num);
    }

    function performUpkeep(bytes calldata num) external override {
        (bool upkeepNeeded, ) = checkUpkeep("");
        
        if (!upkeepNeeded) {
            revert Order__UpkeepNotNeeded(
                address(this).balance,
                s_Wallets.length
            );
        }
        
        uint256 number;
        number = abi.decode(num, (uint256));

        
        
        
        s_nombre = number;
    }
