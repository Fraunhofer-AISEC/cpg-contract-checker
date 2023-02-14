pragma solidity >=0.8.0;

import "../../interfaces/ISimple.sol";

contract Simple is ISimple {

    mapping(address => bool) public override validAddress;
}
