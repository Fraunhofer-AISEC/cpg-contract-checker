function convertToUSD (uint _value ) external {
        uint bbdValue=_value*2;
        if (USDAddress.delegatecall(bytes32(keccak256("approve(address,value)")), this,_value)){
            if (USDToken.transferFrom(msg.sender,this,_value)){
                if (BBDToken.transfer(msg.sender,bbdValue)){}
                else {
                    revert();
                }
            }
            else{
                revert();
            }
        }
    }

    function convertToBBD (uint _value ) external {
        uint bbdValue=_value*2;
        if (BBDAddress.delegatecall(bytes32(keccak256("approve(address,value)")), this,bbdValue)){
            if (BBDToken.transferFrom(msg.sender,this,bbdValue)){
                if (USDToken.transfer(msg.sender,_value)){} 
                else {
                    revert();
                }
            }
            else{
                revert();
            }
        }
    }
