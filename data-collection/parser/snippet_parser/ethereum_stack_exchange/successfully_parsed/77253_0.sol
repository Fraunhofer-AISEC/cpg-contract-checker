pragma solidity ^0.5.11;

contract MyContract {

    
    address contractOwner;

    address[] userFilesList;

    mapping ( string => address ) private accountAddressesByProfile;
    address[] public accountList;

    bytes16[] accountTypes;
    mapping(bytes16 => bool) accountTypesMap;

    constructor() public {
        contractOwner = msg.sender;

        bytes16[5] memory initialAccountTypes = [
            bytes16("Account1"),
            bytes16("Account2"),
            bytes16("Account3"),
            bytes16("Account4"),
            bytes16("Account5")
        ];

        for (uint8 i = 0; i < initialAccountTypes.length; i++ ) {
            bytes16 accountType = initialAccountTypes[i];
            accountTypes.push(accountType);
            accountTypesMap[accountType] = true;
        }
    }

}

