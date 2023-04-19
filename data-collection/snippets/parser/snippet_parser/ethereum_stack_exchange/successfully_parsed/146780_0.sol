

pragma solidity ^0.8.7;

contract ContractB {

    struct ExecutionInfo {
        address module;
        bytes data;
        uint256 value;
    }

    mapping (address => ExecutionInfo) public ExecutionInfos;

    function AddExecutionInfo(bytes memory _data, uint256 _value) public {
        ExecutionInfos[msg.sender].module = msg.sender;
        ExecutionInfos[msg.sender].data = _data;
        ExecutionInfos[msg.sender].value = _value;
    }

    function GetExecutionInfo() public view returns (address, bytes memory, uint256){
        return(ExecutionInfos[msg.sender].module, ExecutionInfos[msg.sender].data, ExecutionInfos[msg.sender].value);
    }

}
