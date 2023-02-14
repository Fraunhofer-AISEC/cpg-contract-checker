    mapping (address => bool) public whitelist;

    modifier onlyWhitelistAddress() {
        require(whitelist[msg.sender] == true);
        _;
    }

    function addressIsWhitelisted(address _address) public returns (bool) { 
        return whitelist[_address] == true;
    }

    function addWhitelistAddress (address _address) public onlyOwner {
        whitelist[_address] = true;
    }

    function removeWhitelistAddress (address _address) public onlyOwner {
        whitelist[_address] = false;
    }
