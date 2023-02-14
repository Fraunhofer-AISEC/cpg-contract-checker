address factory;
address public manager;

modifier restrictedThroughFactory(address user) {
    require(msg.sender == factory && user == manager);
    _;
}

modifier restricted() {
    require(msg.sender == manager);
    _;
}

constructor(address _factory, address creator) {
    factory = _factory;
    manager = creator;
}


function createReward(
    uint256 _contribution,
    uint256 _maxNumber,
    string memory _imageLink
) public restricted {
    _createReward(_contribution, _maxNumber, _imageLink);
}



function createReward(
    uint256 _contribution,
    uint256 _maxNumber,
    string memory _imageLink,
    address user
) public restrictedThroughFactory(user) {
    _createReward(_contribution, _maxNumber, _imageLink);
}

function _createReward(
    uint256 _contribution,
    uint256 _maxNumber,
    string memory _imageLink
) internal {
    Reward memory newReward = Reward({
        contribution: _contribution,
        maxNumber: _maxNumber,
        ImageLink: _imageLink
    });

    rewards.push(newReward);
}
