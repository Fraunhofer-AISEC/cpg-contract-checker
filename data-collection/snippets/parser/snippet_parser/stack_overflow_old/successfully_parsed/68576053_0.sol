pragma solidity ^0.8;

interface IERC20 { 
    function decimals() external view returns (uint8);
    function transferFrom(address _from, address _to, uint256 _amount) external returns (bool);
}

contract MyContract {
    function buy() external {
        IERC20 tokenContract = IERC20(address(0x123)); 

        
        require(
            tokenContract.transferFrom(
                msg.sender, 
                address(this), 
                50 * (10 ** tokenContract.decimals()) 
            ) == true,
            'Could not transfer tokens from your address to this contract' 
        );
        
        
    }
}
