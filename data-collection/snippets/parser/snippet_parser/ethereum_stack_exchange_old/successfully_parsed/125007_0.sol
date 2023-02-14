 function bulkWhitelist
    (
        address[] calldata _to,
        address _projectAddress,
        string calldata _projectName
    )
    public onlyRole(WHITELISTER_ROLE) {
        for (uint256 i=0; i<_to.length; i++) {
            whitelist[_to[i]] = true;
        }
        emit BulkWhitelist(_to, _projectAddress, _projectName, block.timestamp);
    }
