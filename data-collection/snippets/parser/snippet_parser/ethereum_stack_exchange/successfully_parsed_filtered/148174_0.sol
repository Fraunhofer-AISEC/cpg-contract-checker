contract UpgradeableTimelock is Initializable, OwnableUpgradeable, UUPSUpgradeable, Timelock{

    function initialize(address _admin, uint _delay, address _accessManager) public initializer {
        __Ownable_init();
    }

    modifier onlyUpdater() {
        _;
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyUpdater {}

}

