

pragma solidity ^0.8.0;

interface IBEP20 {
    function transfer(address to, uint256 value) external returns (bool);
    function balanceOf(address who) external view returns (uint256);
}

contract TokenDistributer {
    address public owner;
    IBEP20 public token;
    mapping(address => bool) public recipients;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor(address _tokenAddress) {
        owner = msg.sender;
        token = IBEP20(_tokenAddress);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner cannot be the zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    function addRecipient(address recipient) public onlyOwner {
        recipients[recipient] = true;
    }

    function removeRecipient(address recipient) public onlyOwner {
        recipients[recipient] = false;
    }

    function recipientsCount() public view returns (uint256 count) {
        for (uint256 i = 0; i < recipientsList.length; i++) {
            if (recipients[recipientsList[i]]) {
                count++;
            }
        }
    }

    function distributeTokens() public onlyOwner {
        require(token.balanceOf(address(this)) >= 1000000 * recipientsCount(), "Insufficient balance to distribute tokens");

        address[] memory recipientsList = new address[](recipientsCount());
        uint256 recipientIndex = 0;

        for (uint256 i = 0; i < recipientsList.length; i++) {
            if (recipients[recipientsList[i]]) {
                recipientsList[recipientIndex] = recipientsList[i];
                recipientIndex++;
            }
        }

        for (uint256 i = 0; i < recipientsList.length; i++) {
            if (recipients[recipientsList[i]]) {
                require(token.transfer(recipientsList[i], 1000000), "Token transfer failed");
            }
        }
    }
}
