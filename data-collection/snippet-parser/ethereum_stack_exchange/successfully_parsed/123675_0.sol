contract ChineseWhisper {

    address private owner;
    string whisper;
    
    
    event OwnerSet(address indexed oldOwner, address indexed newOwner);
    
    
    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }
    
    
    constructor() {
        owner = msg.sender;
        whisper = "Let the game begin";
        emit OwnerSet(address(0), owner);
    }

    
    function changeOwner(address newOwner, string memory message) public isOwner {
        emit OwnerSet(owner, newOwner);
        whisper = message;
        owner = newOwner;
    }

    
    function getWhisper() public isOwner returns (string memory) {
        return whisper;
    }

    
    function getOwner() external view returns (address) {
        return owner;
    }
}
