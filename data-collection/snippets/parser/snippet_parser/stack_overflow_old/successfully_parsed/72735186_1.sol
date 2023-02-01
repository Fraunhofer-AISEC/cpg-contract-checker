function issue(address _issuee, string calldata _uri, string calldata username, string calldata bio) external {
        require(count <= mintcap, "Only 3 Soulbound Accounts Allowed.");
        _mint(_issuee, count, _uri, username, bio);
        count += 1;
    }
