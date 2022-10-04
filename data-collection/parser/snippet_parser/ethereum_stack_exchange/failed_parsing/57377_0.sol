address owner;

modifier onlyOwner {
    require(msg.sender == owner);
    _;
}

constructor() public {
    owner = msg.sender;
}

function sign(string _msgToBeSigned) public onlyOwner returns (bytes32) {
    
    
}

function verify(bytes32 _signedMessage) public view returns (bool) {
    
    
}
