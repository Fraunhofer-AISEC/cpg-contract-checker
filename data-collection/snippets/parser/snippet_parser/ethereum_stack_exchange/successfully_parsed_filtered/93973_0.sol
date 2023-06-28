address payable owner;
uint public expirationTime;
uint public wordValue;
bytes32 public root;
address[] private allMerchants;
uint public startTime;
bytes32[] usedTokens;


struct merchant {
    address addr;
    uint numOfTokens;
    bytes32[] usedTokens;
}


constructor (uint _timeout, bytes32 _root, uint _wordValue) payable {
    owner = msg.sender;
    expirationTime = block.timestamp + _timeout;
    root = _root;
    startTime = block.timestamp;
    wordValue = _wordValue;
} 


mapping (address => merchant) public Merchants;

function SetUpdateMerchants (bytes32 _token) private {
    var _merchant = merchant(msg.sender, numOfTokens++, usedTokens.push(_token));
    Merchants[msg.sender] = _merchant;
    allMerchants.push(_token)
}
