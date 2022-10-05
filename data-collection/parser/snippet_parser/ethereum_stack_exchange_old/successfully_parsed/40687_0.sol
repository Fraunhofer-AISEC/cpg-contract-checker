contract Owned {
    address owner;
    address[] listuser;
    function Owned() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function whitelistAddress (address user) onlyOwner {
        
    }   

    modifier onlyusers() {
        
        require();
        _;
    }

    function accessbyonlyusers () onlyusers {
    }
}
