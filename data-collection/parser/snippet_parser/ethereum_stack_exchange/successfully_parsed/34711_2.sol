contract MultiOwnable {
    address public manager; 
    address[] public owners;
    mapping(address => bool) public ownerByAddress;

    event SetOwners(address[] owners);

    modifier onlyOwner() {
        require(ownerByAddress[msg.sender] == true);
        _;
    }

    
    function MultiOwnable() public {
        manager = msg.sender;
    }

    
    function setOwners(address[] _owners) public {
        require(msg.sender == manager);
        _setOwners(_owners);

    }

    function _setOwners(address[] _owners) internal {
        for(uint256 i = 0; i < owners.length; i++) {
            ownerByAddress[owners[i]] = false;
        }


        for(uint256 j = 0; j < _owners.length; j++) {
            ownerByAddress[_owners[j]] = true;
        }
        owners = _owners;
        emit SetOwners(_owners);
    }

    function getOwners() public constant returns (address[]) {
        return owners;
    }
}

contract Pausable is MultiOwnable {

    uint public endDate;

    
    modifier whenNotPaused() {
        require(now >= endDate);
        _;
    }
}
