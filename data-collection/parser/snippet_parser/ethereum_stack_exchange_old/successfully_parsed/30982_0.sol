pragma solidity ^0.4.18;

contract TwoD {

    address creater;
    string a;
    string b;

    function compareStrings (string a, string b) view returns (bool)
        
    {
       return keccak256(a) == keccak256(b);
   }
}
