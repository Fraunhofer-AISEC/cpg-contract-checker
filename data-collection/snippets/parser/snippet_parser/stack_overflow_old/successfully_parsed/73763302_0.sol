function createActivity(
        string memory _id,
        string memory _username,
        string memory _title,
        string memory _desc,
        uint256 _totalTimeInMonths,
        uint256 _price,
        uint256 _level,
        uint256 _maxMembers,
        uint256 dateOfCreation,
        uint256 _waitingPeriodInMonths 
    ) public payable {
        require(_price <= minUSD[_level - 1], "ETH limit crossed");
        uint256 id = arrayForLength.length + 1;
        memberAddress.push(payable(msg.sender));
        Activity memory activity = Activity(
            id,
            payable(msg.sender),
            _title,
            _desc,
            _price,
            _level,
            ActivityStatus.OPEN,
            block.timestamp,
            _totalTimeInMonths,
            _maxMembers,
            memberAddress,
            _waitingPeriodInMonths
        );
        Members[msg.sender] = Member(
            _username,
            _totalTimeInMonths,
            dateOfCreation,
            _id,
            block.timestamp
        );
        arrayForLength.push(_id);
        Activities[_id] = activity;
        emit ActivityCreated(
            _id,
            _title,
            _totalTimeInMonths,
            _level,
            dateOfCreation
        );
        delete memberAddress;
    }
