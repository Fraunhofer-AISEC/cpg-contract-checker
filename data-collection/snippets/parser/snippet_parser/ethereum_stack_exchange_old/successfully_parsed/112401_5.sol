contract UserRecord {
    constructor() public { owner = msg.sender; }

    address owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    struct User {
        bytes32 userEmail;
        uint index;
    }

    mapping (bytes32 => User) private users;

    bytes32[] private usersRecords;
    event LogNewUser(bytes32 indexed userEmail, uint index);

    function setUseremail(bytes32 _userEmail) public onlyOwner returns(bool success){
        users[_userEmail].userEmail = _userEmail;
        users[_userEmail].index = usersRecords.push(_userEmail) -1;

        emit LogNewUser(
        _userEmail,
        users[_userEmail].index
        );
        return true;
    }



    function deleteUser(bytes32 _userEmail) public onlyOwner returns(uint index){
        require(!isUser(_userEmail)); 
        uint toDelete = users[_userEmail].index;
        bytes32 lastIndex = usersRecords[usersRecords.length-1];
        usersRecords[toDelete] = lastIndex;
        users[lastIndex].index = toDelete; 
        usersRecords.length--;
        return toDelete;   
    }    
}
