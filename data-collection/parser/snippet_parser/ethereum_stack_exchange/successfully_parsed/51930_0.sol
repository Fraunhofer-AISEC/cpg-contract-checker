pragma solidity ^0.4.24;    
contract myContract{
        bytes32[7500] public array;
        function getArray() public view returns(bytes32[7500]){
            return array;
        }
}
