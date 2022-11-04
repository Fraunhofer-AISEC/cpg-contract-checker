contract UserStorage is BaseStorage {

    event UserCreated(string _message);

    struct Profile {
        uint userId;
        bytes32 username;
      }

    mapping(address => Profile) public profiles;
    mapping(address => bool) public addresses;
    mapping (bytes32 => uint) public usernames;


    uint latestUserId = 0;

    function createUser(
        address _address,
        bytes32 _username
        ) public onlyControllerAddr returns(uint) {

        latestUserId++;

        profiles[_address] = Profile(
        latestUserId,
        _username
        );



        addresses[_address] = true;
        usernames[_username] = latestUserId;

        emit UserCreated("Membership Confirmed");
        return latestUserId;
    }

}
