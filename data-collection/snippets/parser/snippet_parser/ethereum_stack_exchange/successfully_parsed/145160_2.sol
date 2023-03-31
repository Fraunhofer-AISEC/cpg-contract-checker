function submit(address _to, bytes32 _key) public payable {
        require(msg.value > 0);
        uint256 _value = msg.value / 10 ** 18;
        submitted[msg.sender] = true;
        transaction[msg.sender] = Transaction(_to, _value, _key);
        emit SubmittedWithValue(msg.sender, "submitted", _value, "ether");
        emit TransactionSetFor(
            "Transaction is set for",
            _value,
            "by",
            msg.sender,
            "for",
            _to
        );
    }
