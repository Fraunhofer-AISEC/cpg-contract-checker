

pragma solidity ^0.8.17;

interface IBEP20 {
    function transfer(address to, uint256 value) external returns (bool);
    function balanceOf(address who) external view returns (uint256);
}


contract TokenDistributerGBR {
    address[] public recipientsList;
    address public owner;
    IBEP20 public token;
    mapping(address => bool) public recipients;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor(address _tokenAddress) {
        _tokenAddress = 0xA970cAE9Fa1D7Cca913b7C19DF45BF33d55384A9;
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
    require(token.balanceOf(address(this)) >= 1000000 * recipientsList.length, "Insufficient balance to distribute tokens");

    for (uint256 i = 0; i < recipientsList.length; i++) {
        if (recipientsList[i] != address(0)) {
            require(token.transfer(recipientsList[i], 1000000), "Token transfer failed");
        }
    }
}
}
