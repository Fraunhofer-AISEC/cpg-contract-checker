
pragma solidity ^0.8.0;

contract NestedArrays{
    
    mapping(uint256 => uint256[]) mappingArray;
    uint256[2][] multiArray;

    constructor(){
        multiArray.push([1,2]);
        multiArray.push([3,4]);

        mappingArray[0] = [10,20];
        mappingArray[1] = [30,40];
    }

    function getMultiArray() public view returns(uint256[2][] memory){
        return multiArray;
    }

    function getMultiArrayMember(uint256 index) public view returns(uint256[2] memory){
        require(multiArray.length > index, "wrong index");
        return multiArray[index];
    }

    function getMappingArrayMember(uint256 index) public view returns(uint256[] memory){
        return mappingArray[index];
    }
}
