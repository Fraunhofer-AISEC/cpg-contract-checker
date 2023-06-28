pragma solidity >=0.5.0 <0.6.0;

contract ContractB {
    mapping(uint256 => uint256[]) public data;

    function getData(uint256 index) public view returns(uint256[] memory) {
        return data[index];
    }

    function add(uint256 index, uint256 value) public {
        data[index].push(value);
    }
}
