pragma solidity ^0.5.10;
import "./usingOraclize.sol";

contract TimeMachine is usingProvable {

    string public timestamp;
    event LogConstructorInitiated(string nextStep);
    event LogPriceUpdated(string price);
    event LogNewProvableQuery(string description);

    constructor () public payable {
        OAR = OracleAddrResolverI(0x8bE8DC18a310dcb46XXXXXXX30aA85f01499903b);
        emit LogConstructorInitiated("Constructor was initiated. Call 'updateTime()' to send the Provable Query.");
    }

    function pay() public payable {}

    function balance() public view returns(uint256)  {
        return address(this).balance;
    }

    function __callback(bytes32 myid, string memory result) public {
        if (msg.sender != provable_cbAddress()) revert();
        timestamp = result;
        emit LogPriceUpdated(result);
    }

    function updateTime() public payable {
        if (provable_getPrice("URL") > address(this).balance) {
            emit LogNewProvableQuery("Provable query was NOT sent, please add some ETH to cover for the query fee");
        } else {
            emit LogNewProvableQuery("Provable query was sent, standing by for the answer..");
            bytes32 queryId = provable_query("URL", "json(http://worldtimeapi.org/api/timezone/Europe/Bucharest).unixtime");
        }
    }
}
