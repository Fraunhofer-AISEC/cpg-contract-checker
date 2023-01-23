contract Test {
    uint256 i;
    address _receiver;
    string _message;
    uint256 public contractStartTime;

    mapping (address => mapping(uint256=>string)) public message;

    constructor() public {
        i = 10;
        _receiver = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        _message = "Hello World!";
        contractStartTime = block.timestamp;
     }

    function Start(address _receiver, uint256 i, string memory _memory) public {
        for( i=10; i<=20; i++){
            require((block.timestamp - contractStartTime) > 10, "Wait ten seconds!");
            message[_receiver][i] = _message;
            contractStartTime = block.timestamp;
        }
    }
}
