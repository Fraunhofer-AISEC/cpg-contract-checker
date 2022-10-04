pragma solidity ^0.4.18;
import './usingOraclize.sol';

contract CoinFlipOracle is usingOraclize {

  string public result;
  bytes32 public oraclizeID;

  event Log(string text);

  function CoinFlipOracle() {
    Log("Contract created");
  }

  function flipCoin() payable {
    Log("Oraclize query was sent, waiting for response");
    oraclizeID = oraclize_query("WolframAlpha", "flip a coin", 5000000);
  }

  function __callback(bytes32 _oraclizeID, string _result) {
    require(msg.sender == oraclize_cbAddress());
    Log(_result);
    result = _result;
  }

  function getResult() view returns(string) {
    return result;
  }
}
