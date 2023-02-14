pragma solidity ^0.8.12;
contract TargetContract{
    function send() external {}
}
contract Test{
    function getTestData() external pure returns (bytes memory){
        return abi.encodeCall(TargetContract.send,()); 
        
    }
}
