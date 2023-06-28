
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface Bucket {
    function drop(address erc20, uint256 amount) external;
}

contract EmitWinner {
    address hoetokenAddress = 0xA56AfB65Df413F36f9c753c2e8E56249a44AB812;
    address bucketAddress = 0x873289a1aD6Cf024B927bd13bd183B264d274c68;

    ERC20 erc20 = ERC20(hoetokenAddress);

    function approve(uint256 _amount) public {
        erc20.approve(bucketAddress, _amount);
    }

    function drop(uint _amount) external payable {
        bool success = ERC20(erc20).transferFrom(msg.sender, bucketAddress, _amount);
        require(success, "Transaction Failed");
        Bucket(bucketAddress).drop(msg.sender, _amount);
    }
}
