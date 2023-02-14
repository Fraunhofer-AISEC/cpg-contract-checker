contract SupplyChainStorage is SupplyChainStorageOwnable {
    address public lastAccess;

    constructor() {
        authorizedCaller[msg.sender] = 1;
        emit AuthorizedCaller(msg.sender);
    }

    event AuthorizedCaller(address caller);
    event DeAuthorizedCaller(address caller);

    event UserUpdate(address userAddress);
    event UserRoleUpdate(address userAddress);

    modifier onlyAuthCaller() {
        lastAccess = msg.sender;
        require(authorizedCaller[msg.sender] == 1);
        _;
    }

    struct User {
        string name;
        string contactNo;
        bool isActive;
        string profileHash;
    }

    mapping(address => User) userDetails;
    mapping(address => string) userRole;

    mapping(address => uint8) authorizedCaller;

    function authorizeCaller(address _caller) public onlyOwner returns (bool) {
        authorizedCaller[_caller] = 1;
        emit AuthorizedCaller(_caller);
        return true;
    }

    function deAuthorizeCaller(address _caller)
        public
        onlyOwner
        returns (bool)
    {
        authorizedCaller[_caller] = 0;
        emit DeAuthorizedCaller(_caller);
        return true;
    }

    User userData;
   
    function setUser(
        address _userAddress,
        string memory _name,
        string memory _contactNo,
        string memory _role,
        bool _isActive,
        string memory _profileHash
    ) public onlyAuthCaller returns (bool) {
        userData.name = _name;
        userData.contactNo = _contactNo;
        userData.isActive = _isActive;
        userData.profileHash = _profileHash;

        userDetails[_userAddress] = userData;
        userRole[_userAddress] = _role;

        emit UserUpdate(_userAddress);
        emit UserRoleUpdate(_userAddress);
        return true;
    }

    function getUserRole(address _userAddress)
        public
        onlyAuthCaller
        returns (string memory)
    {
        return userRole[_userAddress];
    }

    function getUser(address _userAddress)
        public
        onlyAuthCaller
        returns (
            string memory name,
            string memory contactNo,
            string memory role,
            bool isActive,
            string memory profileHash
        )
    {
        User memory tmpData = userDetails[_userAddress];
        return (
            tmpData.name,
            tmpData.contactNo,
            userRole[_userAddress],
            tmpData.isActive,
            tmpData.profileHash
        );
    }
}
