pragma solidity = 0.8.11;

interface IOtherContract{
    function checkAddress(address wallet) external returns (address pair);
    function addAddress(address wallet) external;
}
