    mapping (uint => Users) public users;
    mapping(address => bool) _isRegistered;
    mapping(address => uint) public userId; 

    constructor() public {
        owner = msg.sender;
        userCount = 0;
    }

function addUser(string memory _name, bool _isReg) contractIsActive() public returns (bool){
        require(!_isRegistered[msg.sender], "sender is already registered");
        emit LogUser(userCount);
        emit LogAddressUser(msg.sender);
        users[userCount] = Users({name: _name, userId: userCount, signedUp: _isReg});
        _isRegistered[msg.sender] = true;
        
        userId[msg.sender] = userCount; 

        userCount += 1;
        return true;
    }

function fetchUser(uint _id) public view returns(string memory name, uint id, bool signed){
        name = users[_id].name;
        id = users[_id].userId;
        signed = users[_id].signedUp;

        return(name, id, signed);
    }


function fetchUserId(address _userAddress) public view returns(uint id){
    return userId[_userAddress];
    }
