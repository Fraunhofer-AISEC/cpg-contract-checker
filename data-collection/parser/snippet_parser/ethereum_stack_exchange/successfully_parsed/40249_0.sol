pragma solidity ^0.4.4;

import "./usingOraclize.sol";

contract BondRegister is usingOraclize {

uint public energy;

event Log(string text);

function BondRegister() {

 Log("Contract created");
 OAR = OraclizeAddrResolverI(0x6f485C8BF6fc43eA212E93BBF8ce046C7f1cb475);
}


function getCall() payable returns(bool success) {

 oraclize_query("URL", "json(https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD).USD");
}


function __callback(bytes32 _myid,string result) {

if (msg.sender != oraclize_cbAddress()) { 
     Log("thrown error");
     throw;
 }
Log("Entered callback function");
Log(result);
energy = parseInt(result, 2);

}


function getenergy() returns (uint) {
return energy;
}
}
