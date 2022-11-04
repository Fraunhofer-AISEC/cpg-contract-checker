contract Owned {
    address owner;
    mapping(address=>bool) allowedUsers;
    function Owned() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function whitelistAddress (address user) onlyOwner {
        allowedUsers[user]=true;
    }   

    modifier onlyusers() {
        
        require(allowedUsers[msg.sender]);
        _;
    }

    function accessbyonlyusers () onlyusers {
        
    }
}
