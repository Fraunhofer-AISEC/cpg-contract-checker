pragma solidity ^0.8.0;

import { ABDKMath64x64 } from "./ABDKMath64x64.sol";

contract FloorCeil {

    int128 constant unity = 18446744073709551616;

    function floor(int128 fp) public pure returns(int128) {
        return ABDKMath64x64.fromInt(int256(ABDKMath64x64.toInt(fp)));
    }

    function ceil(int128 fp) public pure returns(int128) {
        if (fp == 0 || fp%unity == 0) {
            return fp;
        }
        return floor(ABDKMath64x64.fromInt(int256(ABDKMath64x64.toInt(ABDKMath64x64.add(fp, unity)))));
    }
}
