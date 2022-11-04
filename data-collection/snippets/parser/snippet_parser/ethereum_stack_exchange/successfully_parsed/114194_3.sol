function performUpkeep(bytes calldata performData) external override {
        uint256 decodedValue = abi.decode(performData, (uint256));
        if(decodedValue == 0){
            setTime();
        } 
        if(decodedValue == 1){
            withdraw();
        }
    }
