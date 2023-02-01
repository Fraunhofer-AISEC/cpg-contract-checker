 constructor(
    address _manager,
    string memory name,
    string memory description,
    string memory imageHash,
    uint256 price,
    string[] memory moduleNames,
    string[] memory moduleDescriptions,
    string[] memory materialHashes,
    string[] memory questionHashes
) {
    
    manager = _manager;
    tokenHoldersCounter = 1;
    tokenHolders[0] = manager;
    numOfMaintainers = 1;
    balance[manager] = 500;
    tokenPot = 500;
    dadAddress = msg.sender;
    courseName = name;
    courseDescription = description;
    courseImageHash = imageHash;
    coursePrice = price;
    pushModules(
        moduleNames,
        moduleDescriptions,
        materialHashes,
        questionHashes
    );
}
