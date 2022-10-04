pragma solidity ^0.5.12;

import "./customer.sol";
contract BankA{
  function creation() public returns(string memory){
    customer client=new customer();
    client.prime("Alireza Kiakojouri","5000077563", true, 2, here);
    return uint2str(uint(client.Array()));
  }
  function uint2str(uint _i) internal pure returns (string memory ) {
    if (_i == 0) {
        return "0";
    }
    uint j = _i;
    uint len;
    while (j != 0) {
        len++;
        j /= 10;
    }
    bytes memory bstr = new bytes(len);
    uint k = len - 1;
    while (_i != 0) {
        bstr[k--] = byte(uint8(48 + _i % 10));
        _i /= 10;
    }
    return string(bstr);
  }
  function() external payable{}
  }
