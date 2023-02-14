function performUpkeep(bytes calldata performData) external override {
        if(functionToCall == 0){
            setTime();
        } 
        if(functionToCall == 1){
            withdraw();
        }
    }
