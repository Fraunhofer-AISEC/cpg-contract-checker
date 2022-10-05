contract SamrtB is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    
      using CountersUpgradeable for CountersUpgradeable.Counter;
       CountersUpgradeable.Counter private _tokenIdCounter;
       constructor() initializer {}
    
        function initialize(address _token) initializer public {
            __Ownable_init();
            __UUPSUpgradeable_init();
            tokenAccepted =IERC20Upgradeable(_token);
           
        }
 IERC20Upgradeable public tokenAccepted;
    ....
