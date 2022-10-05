
pragma solidity ^0.8.0;


contract Bet{
    
    event Hello(
      address acc0, address acc1, address acc2,
      address acc3,address acc4, address acc5);
        
    constructor(
        address acc0, 
        address acc1,
        address acc2,
        address acc3,
        address acc4,
        address acc5
    ) payable {
        emit Hello(acc0, acc1, acc2, acc3, acc4,acc5);
    }
    
    function totalSupply() public pure returns (uint256)
    {
        return 250000000 * 10 ** 8;
    }

}
