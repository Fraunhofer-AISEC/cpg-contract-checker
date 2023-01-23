pragma solidity ^0.4.11;
interface TokenInterface {
    function transfer(address recipient, uint amount) external returns(bool);
}
