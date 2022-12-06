contract Stoppable {

    bool public isRunning;

    modifier onlyIfRunning {
        require(isRunning);
        _;
    }

    function Stoppable() public {
        isRunning = true;
    }

    function setRunSwitch(bool newSetting) public returns(bool contractRunning) {
        isRunning = newSetting;
    }
}
