pragma solidity >=0.7.0 <0.9.0;

contract base{

    uint data;
    constructor (uint _data) public {
        data = _data;

    }
    function getData() public view returns(uint) {
        return data;
    }

}
