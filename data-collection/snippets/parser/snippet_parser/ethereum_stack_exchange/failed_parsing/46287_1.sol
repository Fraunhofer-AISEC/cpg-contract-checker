pragma solidity ^0.4.21;
contract SplitPayment
{
    uint constant shareSum = 1000000000;

    address public A = 0xaaa...; 
    uint256 public A_share  = 111111111;

    address public B = 0xbbb...;
    uint256 public B_share  = 222222222;

    address public C = 0xccc...;

    function() payable public
    {
        uint256 balance = address(this).balance;

        uint toA = (balance * A_share) / shareSum;
        uint toB = (balance * B_share) / shareSum;
        uint toC = balance - (toA + toB);

        A.transfer(toA);

        B.transfer(toB);

        C.transfer(toC);

        assert(address(this).balance == 0);
    }
}
