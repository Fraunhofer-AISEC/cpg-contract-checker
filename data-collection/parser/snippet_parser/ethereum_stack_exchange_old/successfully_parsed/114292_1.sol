    function setName(string memory name) external {
        require(_names[name]==address(0), "Duplicate name");

        _names[_addresses[msg.sender]] = address(0);

        _names[name] = msg.sender;
        _addresses[msg.sender] = name;
    }
