
    address _vrfCoordinator = 0xb3dCcb4Cf7a26f6cf6B120Cf5A73875B7BBc655B;
    address _link =     0x01BE23585060835E02B77ef475b0Cc51aA1e0709;
    bytes32 _keyHash = 0x2ed0feb3e7fd2022120aa84fab1945545a9f2ffc9076fd6156fa96eaff4c1311;
    uint256 _fee = 0.1 * 10 ** 18; 
    constructor() RandomNumberConsumer(_vrfCoordinator, _link, _keyHash, _fee) {}
