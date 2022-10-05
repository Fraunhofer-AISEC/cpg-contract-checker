pragma solidity ^0.4.21;
contract SplitPayment
{
    address public A = 0xAAA; 
    uint256 public A_share  = 111111111;

    address public B  = 0xBBB;
    uint256 public B_share  = 222222222;

    address public C = 0xCCC;
    uint256 public C_share = 666666667;

    function sendPayment(address person, uint256 raw_share) private 
    {
        uint256 balance = address(this).balance;
        person.transfer(balance * raw_share / 1000000000);
    }
    function() payable public
    {
        sendPayment(A, A_share);
        sendPayment(B, B_share);
        sendPayment(C, C_share);
    }
}
