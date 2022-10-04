contract ParentA is OwnableUpgradeable  {
    function __ParentA_init() internal onlyInitializing {
        __Ownable_init();
        __ParentA_init_unchained();
    }

    function __ParentA_init_unchained() internal onlyInitializing {}

    function fn1() public onlyOwner {}
}


contract ParentB is OwnableUpgradeable  {
    function __ParentB_init() internal onlyInitializing {
        __Ownable_init();
        __ParentB_init_unchained();
    }

    function __ParentB_init_unchained() internal onlyInitializing {}

    function fn2() public onlyOwner {}
}

contract Core is initializable, ParentA, ParentB  {
    function initialize() public initializer {
        __ParentA_init();
        __ParentB_init();
    }
}

