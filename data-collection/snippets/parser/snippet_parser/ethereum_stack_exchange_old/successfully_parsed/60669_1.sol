pragma solidity ^0.4.25;

import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";
import "github.com/Arachnid/solidity-stringutils/strings.sol";

contract OraclizeTest is usingOraclize {

    using strings for *;

    string public randomNumbers;
    bytes32 public loadNewRandomNumbersQueryId;

    event NewRandomNumbers(string _randomNumbers);

    function loadNewRandomNumbers() public payable {
        loadNewRandomNumbersQueryId = oraclize_query("WolframAlpha", "10 unique random numbers between 0 and 53");
    }

    function __callback(bytes32 _queryId, string _result) public {
        require(_queryId == loadNewRandomNumbersQueryId, "Oraclize Query Id Does Not Match");
        require(msg.sender == oraclize_cbAddress(), "Invalid Oraclize Callback Address");

        if (_queryId == loadNewRandomNumbersQueryId) {
            randomNumbers = _result;
            emit NewRandomNumbers(randomNumbers);
        }
    }

    function parseRandomNumbers() public view returns (uint[] _randomNumbersArray) {
        strings.slice memory s = randomNumbers.toSlice();
        strings.slice memory delim = ",".toSlice();
        uint[] memory parts = new uint[](s.count(delim) + 1);
        for (uint i = 0; i < parts.length; i++) {
            parts[i] = parseInt(s.split(delim).toString());
        }
        return parts;
    }

}
