contract GovernanceToken is Initializable, ERC20Upgradeable, ERC20PermitUpgradeable, ERC20VotesUpgradeable, OwnableUpgradeable, UUPSUpgradeable {
    
    constructor() {
        _disableInitializers();
    }

    function initialize() initializer public {
        __ERC20_init("GovernanceToken", "GT");
        __ERC20Permit_init("GovernanceToken");
        __ERC20Votes_init();
        __Ownable_init();
        __UUPSUpgradeable_init();
    }

    
}
