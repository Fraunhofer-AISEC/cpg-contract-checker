address[] public users = [0xd22Ab922D5ABE0810798aec78c20FA232C7Ea810798aec78c20FA232C7Ea5fa];
    mapping(address => bool) whitelist;

    constructor () {
        for (uint256 i = 0; i < users.length; i++) {
            whitelist[users[i]] = true;
        }
    }
