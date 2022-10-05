

pragma solidity >=0.6.0 <0.9.0;

contract MyContract {
    uint256[] myVal;
    uint256[] _arr;

    function store(uint256 _myVal) public {
        myVal.push(_myVal);
        for(uint256 _y = 0; _y < myVal.length; _y++){
            _arr[_y] = myVal[_y];
        }
    }
    function retrieve() public view returns (uint256[] memory) {
        return _arr;
    }
}
