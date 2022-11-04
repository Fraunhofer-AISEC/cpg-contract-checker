constructor (
        string memory _name,
        string memory _imageURL,
        string memory _description,
        string memory _descriptionURL,
        uint256 _goalAmount,
        uint256 _expiresInDays,
        uint256 _refundPeriodInDays,
        address payable _beneficiary,
        address _custodian
    ) {
        name = _name;
        imageURL = _imageURL;
        description = _description;
        descriptionURL = _descriptionURL;
        beneficiary = _beneficiary;
        goalAmount = _goalAmount;
        expiresInDays = _expiresInDays;
        refundPeriodInDays = _refundPeriodInDays;
        campaignStartTime = block.timestamp;
        _transferOwnership(_custodian);
    }

