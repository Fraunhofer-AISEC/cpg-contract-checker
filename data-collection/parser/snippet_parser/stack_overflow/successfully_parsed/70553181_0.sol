pragma solidity ^0.8;

interface IERC20 {
    function transfer(address _to, uint256 _amount) external returns (bool);
}

contract MyContract {
    function withdrawToken(address _tokenContract, uint256 _amount) external {
        IERC20 tokenContract = IERC20(_tokenContract);
        
        
        
        tokenContract.transfer(msg.sender, _amount);
    }
}
