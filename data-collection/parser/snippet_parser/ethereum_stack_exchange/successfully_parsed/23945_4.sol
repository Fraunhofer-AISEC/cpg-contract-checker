    function mintPresale(uint256 _quantity, bytes32[] calldata _proof)
        external
        payable
    {
        require(_verify(_leaf(msg.sender), _proof), "Invalid merkle proof");
        _mint(_quantity, msg.sender);
    }
