contract Managed is Owned {          

    mapping (address => bool) public managers;

    constructor() public Owned() {
        managers[owner] = true;
    }

    
    modifier managerOnly {
        require(managers[msg.sender]);
        _;
    }

    function setManager(address manager, bool state) public ownerOnly {
        managers[manager] = state;
    }
}
