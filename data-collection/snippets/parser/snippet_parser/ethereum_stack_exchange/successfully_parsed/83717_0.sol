    modifier requireContractOwner() {
        require(msg.sender == contractOwner, "Caller is not contract owner");
        _;
    }

    function _authorizeCaller(address addr)
        external
        requireContractOwner
    {
        authorizedCaller[addr] = true;
    }
