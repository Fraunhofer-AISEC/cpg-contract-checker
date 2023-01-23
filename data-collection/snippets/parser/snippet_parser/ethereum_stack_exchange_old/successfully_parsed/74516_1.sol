pragma solidity 0.5.1;

import "./HitchensOrderTree.sol";

contract MinValues {

    using HitchensOrderStatisticsTreeLib for HitchensOrderStatisticsTreeLib.Tree;
    HitchensOrderStatisticsTreeLib.Tree playerPredictions; 

    

    function setBid(address player, uint prediction) public {
        playerPredictions.insert(addressToKey(player), prediction);
    }

    

    function min() public view returns(uint) {
        return playerPredictions.first();
    }

    

    function minKeyCount() public view returns(uint value, uint count) {
        uint lowest = min();

        

        (uint _parent, uint _left, uint _right, bool _red, uint _keyCount, uint _count) = playerPredictions.getNode(lowest);
        return (playerPredictions.first(), _keyCount);
    }

    

    function playerMinAtRow(uint row) public view returns(address) {
        uint lowest = min();
        return keyToAddress(playerPredictions.valueKeyAtIndex(lowest, row));
    }

    

    function addressToKey(address a) internal pure returns(bytes32) {
        return bytes32(int(int160(a)));
    }

    function keyToAddress(bytes32 b) internal pure returns(address) {
        return address(uint160(uint(b)));
    }       
}
