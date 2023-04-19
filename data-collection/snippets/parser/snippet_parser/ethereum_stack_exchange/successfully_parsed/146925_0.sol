
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface Bucket {
    function drop(address erc20, uint amount) external;
}

contract ERCWinner {
    constructor() {}

    address AmitToken = 0x2527D2e6d78915632b408f364c94EC4F6B3729a7;
    address bucket = 0x873289a1aD6Cf024B927bd13bd183B264d274c68;
    uint x = 1;
    ERC20 token = ERC20(AmitToken);

    function drop(uint _amount) external {
        token.approve(bucket, 10);
        Bucket(bucket).drop(AmitToken, _amount);
    }

    function abc(uint amt) external returns (uint) {
        x = amt;
        return x;
    }
}
