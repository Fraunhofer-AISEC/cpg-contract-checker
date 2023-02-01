pragma solidity ^0.4.0;

import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";


contract IpMeta is usingOraclize {

    uint public metadata;

    function Metadata(bytes32 _ipAddress) public {
        update(_ipAddress);
    }

    function __callback(bytes32 myid, string result) public {
        if (msg.sender != oraclize_cbAddress()) revert();
        bytes32 ipMetadata = result;
        
    }

    function update(bytes32 ipAddress) public payable {
        oraclize_query("URL", "xml(https://ipresolver.com?ipresolve=" . ipAddress . ")");
    }
}
