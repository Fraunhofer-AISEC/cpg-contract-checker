
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Cafe is Ownable {
    address public cafeToken;

    function setCafeToken(address _cafeToken) public onlyOwner {
        cafeToken = _cafeToken;
    }

    
    function sendToken(address _receiverAddress, uint _tokenAmount) public {
        require(_tokenAmount > 0, "token should be more than 0");
        IERC20(cafeToken).transferFrom(
            address(this),
            _receiverAddress,
            _tokenAmount
        );
    }

    
    function getRewards() public returns (bool) {
        require(
            IERC20(cafeToken).balanceOf(msg.sender) >= 10,
            "Not enough token for rewards!"
        );
        IERC20(cafeToken).transferFrom(msg.sender, address(this), 10);
        return true;
    }
}
