pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface Bucket {
    function drop(address erc20, uint256 amount) external;
}

contract EmitWinner {

    constructor() payable {}

    address hoetokenAddress = 0xA56AfB65Df413F36f9c753c2e8E56249a44AB812;
    address bucketAddress = 0x873289a1aD6Cf024B927bd13bd183B264d274c68;

    ERC20 erc20 = ERC20(hoetokenAddress);

    mapping(address => uint) tokenOwnerBalance;
    mapping (address => mapping (address => uint256)) allowed;

    
    function approve(address spender, uint256 _amount) public {
        erc20.approve(spender, _amount);
    }


     function drop(address tokenOwner, uint256 _amount) external {
        bool success = ERC20(erc20).transferFrom(tokenOwner, bucketAddress, _amount);
        require(success, "Transaction Failed");
        Bucket(bucketAddress).drop(tokenOwner, _amount);
    }

    receive() external payable {}
}
