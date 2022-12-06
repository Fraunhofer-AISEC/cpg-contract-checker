pragma solidity ^0.8;

interface IERC20 {
    function transfer(address _to, uint256 _amount) external returns (bool);
}

contract MyContract {
    modifier onlyOwner {
        require(msg.sender == address(0x123), 'Not authorized');
        _;
    }

    function withdrawERC20Token(address _tokenContractAddress, uint256 _amount) external onlyOwner {
        IERC20 token = IERC20(_tokenContractAddress);
        
        
        
        bool success = token.transfer(msg.sender, _amount);
        require(success, 'Could not withdraw');
    }
}
