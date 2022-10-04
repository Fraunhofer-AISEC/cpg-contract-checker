pragma solidity ^0.6.4;

import { Count } from  './Count.sol';  

interface ICount {
    function subUint(Count.hold calldata s, uint b) external view returns(uint);
    function setA(Count.hold calldata s, uint _a) external returns (bool);
    function setGood(Count.hold calldata s, uint _a, bool _good) external returns (bool);
    function showGood(Count.hold calldata s, uint _a) external view returns (bool);
}
