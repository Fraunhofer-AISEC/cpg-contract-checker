contract UpgradebleTest1 is Initializable {
    uint public x;

    function initialize(uint _x) public initializer {
        internalInit(_x);
    }

    function internalInit(uint _x) internal initializer {
        x = _x;
    }
}
