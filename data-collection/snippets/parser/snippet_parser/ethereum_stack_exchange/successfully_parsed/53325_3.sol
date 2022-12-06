pragma solidity ^0.4.24;
contract Timestamping {
    mapping(string => uint256) timestamps;

    function setTimestamp(string hash) {
        
        require(timestamps[hash] == 0);
        timestamps[hash] = now;
    }
}
