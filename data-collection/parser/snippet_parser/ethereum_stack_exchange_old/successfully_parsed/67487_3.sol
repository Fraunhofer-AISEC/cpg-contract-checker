pragma solidity ^0.5.0;

contract Ownable {

    mapping (address => bool) public authorizedContractAdresses;

    function addContractAdresses(address _address) 
        public
    {
        authorizedContractAdresses[_address] = true;
    }
}
