contract Whitelist {

    mapping(address => bool) Users;
    address private owner;
    address private otherOwner;

    function Whitelist() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender);
            _;
    }

    function userAdd(address userAddress) onlyOwner {
            require(userAddress != 0x0 && !Users[userAddress]);             
            Users[userAddress] = true;    

    }

    function isWhitelisted(address passAddress) external returns (bool) {   
        return Users[passAddress];
    }
}