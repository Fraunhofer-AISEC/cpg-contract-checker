contract Implementation {
    bool private initialized;

    address public deployer;   
    address public user;

    function initialize(address _user) public {
        require(!initialized, "Already initialized!");
        initialized = true;

        deployer = msg.sender;
        user = _user;
    }

    ...
}
