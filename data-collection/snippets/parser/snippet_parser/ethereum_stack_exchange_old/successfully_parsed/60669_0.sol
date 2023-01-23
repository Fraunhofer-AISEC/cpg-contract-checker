pragma solidity ^0.4.25;

import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";
import "github.com/willitscale/solidity-util/lib/Strings.sol";
import "github.com/willitscale/solidity-util/lib/Integers.sol";
import "github.com/willitscale/solidity-util/lib/Addresses.sol";

contract Oraclize is usingOraclize {

    using Strings for string;
    using Integers for uint;
    using Addresses for address;

    string public randomNumbers;
    uint[] public randomNumbersArray;

    event newOraclizeQuery(string description);
    event randomNumbersGenerated(string randomNumbers);

    constructor() public {
        update();
    }

    function __callback(bytes32, string result) public {
        if (msg.sender != oraclize_cbAddress()) revert();
        randomNumbers = result;

        string[] storage split = result.split(" ");

        for (uint i = 0; i < split.length; i++) {
            randomNumbersArray.push(parseInt(split[i]));
        }

        emit randomNumbersGenerated(randomNumbers);
    }

    function update() public payable {
        emit newOraclizeQuery("Loading new set of random numbers, standing by for the answer...");
        oraclize_query('URL', '...');
    }

}
