pragma solidity >=0.7.0 <0.9.0;

contract Agent {

    address[] parents;

    constructor(
        address[] memory _parents
    ){
        parents = _parents;
    }

    function getParents() public view returns (address[] memory) {
        return parents;
    }
}
