<?php
session_start();
error_reporting(1);
include 'ENGINE.PHP';

$token = '?token=YOURFREETOKEN';
$server = "eth/main";

$data = "{\"solidity\":\"contract mortal { address owner; function mortal() { owner = msg.sender; } function kill() { if (msg.sender == owner) suicide(owner); } } contract greeter is mortal { string greeting; function greeter(string _greeting) public { greeting = _greeting; } function greet() constant returns (string) { return greeting; } }\",\"params\":[\"Hello BlockCypher Test\"]}";
$contract_details = blockcypher("POST","$server/contracts$token",$data);
echo "<br><br>USDT Generate Contract: ";
var_dump($contract_details);
