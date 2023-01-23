contract PercDistribution {

    mapping (address => uint256) balances;
    mapping (address => bool) public blacklist;
    Token public myToken;
    address public owner;

    function PercDistribution(address _tokenAddress, address _owner) {
        myToken = Token(_tokenAddress);
        owner = _owner;
    }

    function enableWhitelist(address[] _addresses) onlyOwner {
    for (uint i = 0; i < _addresses.length; i++) {
            blacklist[_addresses[i]] = false;
        }
    }

    function disableWhitelist(address[] _addresses) onlyOwner {
    for (uint i = 0; i < _addresses.length; i++) {
            blacklist[_addresses[i]] = true;
        }
    }

    modifier onlyWhitelist() {
        require(blacklist[msg.sender] == false);
        _;
    }

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    function () payable onlyWhitelist public {
        address investor = msg.sender;
        
        blacklist[investor] = true;
    }

}
