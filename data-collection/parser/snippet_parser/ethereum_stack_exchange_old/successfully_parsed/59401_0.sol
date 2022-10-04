contract MyContract {

    uint256 someLevel;

    function changeLevel(uint _newLevel) public {
        someLevel = _newLevel;
    }
}
