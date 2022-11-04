
pragma solidity ^0.8.0;

contract MyContract
{
    mapping(uint256 => People) dataList;
    uint256[] countArr;
    struct People{
        string name;
        uint256 favNum;
    }
}