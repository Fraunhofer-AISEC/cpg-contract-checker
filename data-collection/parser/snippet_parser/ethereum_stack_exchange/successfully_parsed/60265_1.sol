pragma solidity 0.4.25;

contract DeleteArrayElement {

    address[] public entities;

    constructor() public {
        entities.push(1); 
        entities.push(2); 
        entities.push(3); 
        delete entities[1];
    }

    function isEmpty(uint row) public view returns(bool isIndeed) {
        return entities[row] == address(0);
    }

}
