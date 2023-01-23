address public administrator;

constructor() public
    {
        administrator = msg.sender;
        addKey(msg.sender, 1, 1);
        emit KeyAdded(msg.sender, 1, 1);
    }
   
mapping(address => Key)keys;
mapping(uint256 => address[])keysByType;
mapping(uint256 => address[])keysByPurpose;

event KeyAdded(address indexed key, uint256 indexed purpose, uint256 indexed keyType);

struct Key {
        uint256 purpose;
        uint256 keyType;
        address key;
    }

modifier onlyAdmin
    {
        require(msg.sender == administrator, "Sender is not admin");
        _;
    }

function addKey(address _address, uint256 _purpose, uint256 _type) public onlyAdmin override returns(bool success)
    {
        require(keys[_address].purpose != _purpose, "Key Already Exists");
        keys[_address].key = _address;
        keys[_address].purpose = _purpose;
        keys[_address].keyType = _type;

        keysByType[_type].push(_address);
        keysByPurpose[_purpose].push(_address);

        emit KeyAdded(_address, _purpose, _type);
        return true;
    }
