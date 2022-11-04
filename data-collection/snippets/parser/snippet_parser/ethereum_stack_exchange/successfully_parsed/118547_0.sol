pragma solidity ^0.8.10;

import { ABDKMath64x64 } from "./ABDKMath64x64.sol";

contract FixedPoint {
    
    int128 constant someFixedPointInteger = ABDKMath64x64.fromUInt(123);
}
