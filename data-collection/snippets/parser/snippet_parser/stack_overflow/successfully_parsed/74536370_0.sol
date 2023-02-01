
pragma solidity ^0.8.9;

import "./ERC20Mod.sol";

contract Wiseth is ERC20, Ownable {
    using SafeMath for uint256;
    uint deployDate;
    uint daHour;
    bool isPassed;
    bytes32 num_type;
    uint public percentage;

}