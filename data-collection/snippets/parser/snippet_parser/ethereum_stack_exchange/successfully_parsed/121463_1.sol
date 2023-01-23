    function makeCall(uint command, uint256[] memory _data) public  returns (uint256){
        logic = MyLogic(_logicAddress);
        return logic.ModifyData( command, _data);
    }
