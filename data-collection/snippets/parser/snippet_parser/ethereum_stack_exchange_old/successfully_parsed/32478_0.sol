contract PercDistribution {

    mapping (address => uint256) balances;
    mapping (address => bool) public whitelist;
    Token public myToken;
    address public owner;

    function PercDistribution(address _tokenAddress, address _owner) {
        myToken = Token(_tokenAddress);
        owner = _owner;
    }

    function enableWhitelist(address[] _addresses) onlyOwner {
    for (uint i = 0; i < _addresses.length; i++) {
            whitelist[_addresses[i]] = true;
        }
    }

    function disableWhitelist(address[] _addresses) onlyOwner {
    for (uint i = 0; i < _addresses.length; i++) {
            whitelist[_addresses[i]] = false;
        }
    }

    modifier onlyWhitelist() {
        require(whitelist[msg.sender] == true);
        _;
    }

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    function () payable onlyWhitelist public {
        address investor = msg.sender;
        
        whitelist[investor] = false;
    }

}
