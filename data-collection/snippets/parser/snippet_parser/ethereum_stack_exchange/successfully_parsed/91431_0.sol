
pragma solidity ^0.6.12;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract Example {

    address public owner;
    address private ZERO_ADDRESS = 0x0000000000000000000000000000000000000000;
    mapping(string => address) public contractAddressERC20;
    
    constructor() public {
        owner = msg.sender;
    }

    
    function registerTokenERC20(string memory tokenName, address tokenContractAddress) external onlyAdmin() isToken(tokenName) {
        require(contractAddressERC20[tokenName] == ZERO_ADDRESS, 
            "token address is already registered");
        require(bytes(tokenName).length < 25, 
            "token name too long");
        contractAddressERC20[tokenName] = tokenContractAddress;
    }
    
    
    function unRegisterTokenERC20(string memory tokenName) external onlyAdmin() isToken(tokenName) {
        require(contractAddressERC20[tokenName] != ZERO_ADDRESS, 
            "token address is not registered yet");
        contractAddressERC20[tokenName] = ZERO_ADDRESS;
    }

     
    function depositERC20Token(string memory tokenName, uint256 amount) external {
        require(contractAddressERC20[tokenName] != ZERO_ADDRESS, 
            "token is not registered into the platform");
        require(IERC20(contractAddressERC20[tokenName]).allowance(msg.sender, address(this)) >= amount, 
            "token amount to be transferred is not yet approved by User"); 
        IERC20(contractAddressERC20[tokenName]).transferFrom(msg.sender, address(this), amount);
    }

    
    function depositEther() external payable {
        require(msg.value > 0, "amount must be greater than 0 ethers");
    }
    
    
    modifier isToken(string memory tokenName) {
        bytes memory bytesTokenName = bytes(tokenName);
        require(bytesTokenName.length != 0, "tokenName can't be empty");
        _;
    }

    
    modifier onlyAdmin() {
        require(msg.sender == owner, "only admin");
        _;
    }
    
    
    function getBalance() public view returns (uint256) {
        return payable(address(this)).balance;
    }
}
