pragma solidity ^0.8.0;

contract Upload{
    
    mapping(uint8=>string) internal info;

    function setInfo(uint8 id, string calldata Input) external{

        info[id] = Input;
    }

    function getInfo(uint8 id) external view returns (string memory){
        return (info[id]);
    }
}
