pragma solidity ^0.8;

interface IBEP20 {
    
    function balanceOf(address _owner) external view returns (uint256);
}

contract checkBalanceOf {
    address bankAddress = address(0x123);

    
    function balanceOf() external view returns (uint256) {
        
        IBEP20 WBNBContract = IBEP20(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);

        
        return WBNBContract.balanceOf(bankAddress);
    }
}
