pragma solidity ^0.8;

interface ITokenContract {
    function transfer(address _receiver, uint256 _amount) external returns (bool);
}

contract MyGame {
    ITokenContract tokenContract = ITokenContract(address(0x123));
    uint256 public claimAmount;
    address public owner;
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function claimTokens() external {
        
        
        bool success = tokenContract.transfer(msg.sender, claimAmount);
        require(success);
    }
    
    function setClaimAmount(uint256 _claimAmount) external onlyOwner {
        claimAmount = _claimAmount;
    }
}
