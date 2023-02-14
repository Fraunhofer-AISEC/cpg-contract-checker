pragma solidity ^0.4.24;
import './usingOraclize.sol';

contract functionChain is usingOraclize {
    string public globalKey;
    mapping (bytes32 => bool) validIds;

    event LogResult(string result);
    event LogNewOraclizeQuery(string description);
    event LogFundsReceived(address sender, uint amount);

    constructor() public payable {
        OAR = OraclizeAddrResolverI(your oraclize address);
    }

    function() payable {
        LogFundsReceived(msg.sender, msg.value);
    }

    function __callback(bytes32 myid, string result) public {
        require(validIds[myid]);
        require(msg.sender == oraclize_cbAddress());
        globalKey = result;
        LogResult(result);
        delete validIds[myid];
    }

    function setData() public payable {
        if (oraclize_getPrice("URL") > this.balance) {
            LogNewOraclizeQuery("Oraclize query was NOT sent");
        }
        else {
            LogNewOraclizeQuery("Oraclize query was sent");
            bytes32 queryId = oraclize_query("URL", "json(http://QUERY_LINK)");
            validIds[queryId] = true;
        }
    }
}
