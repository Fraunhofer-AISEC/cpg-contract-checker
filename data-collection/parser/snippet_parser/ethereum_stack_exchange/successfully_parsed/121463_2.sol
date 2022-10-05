    uint256 private _latestValue;

    function makeCall(uint command, uint256[] memory _data) public  returns (uint256){
        logic = MyLogic(_logicAddress);
        _latestValue = logic.ModifyData( command, _data);
        return _latestValue ;
    }

    function getLatestValue() public view returns(uint256) {
        return _latestValue;
    } 
