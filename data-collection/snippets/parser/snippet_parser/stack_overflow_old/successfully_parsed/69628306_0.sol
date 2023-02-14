    function checkEmptyBytes(bytes calldata _data) external pure returns (string memory){
        if (_data.length > 0){
            return "NOT_ZERO";
        }
        return "ZER0";
        
    }
