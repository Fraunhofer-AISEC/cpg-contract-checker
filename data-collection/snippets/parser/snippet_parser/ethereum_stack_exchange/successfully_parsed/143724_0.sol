mapping (address => bool) public registeredAddresses;

function register(address addr) public {
        
        require(!registeredAddresses[addr]); 
        
        require(msg.sender == addr);
        registeredAddresses[addr] = true;
    }
