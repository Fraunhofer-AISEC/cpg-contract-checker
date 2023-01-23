pragma solidity 0.6.12;

contract TokenManager {
    address public owner;
    mapping(bytes32 => mapping(bytes32 => address)) public contractERC20;

    constructor() public {
        owner = msg.sender;
    }

    function register(
        bytes32 network,
        bytes32[] memory tokenNames,
        address[] memory tokenAddresses
    ) external {
        require(msg.sender == owner);
        uint256 length = tokenNames.length;
        require(length == tokenAddresses.length);
        for (uint256 i = 0; i < length; i++)
            contractERC20[network][tokenNames[i]] = tokenAddresses[i];
    }
}
