

pragma solidity >=0.7.0 <0.9.0;

contract A {
    uint256[] public numbers;
    
    constructor(uint256[] memory _numbers) {
        for(uint256 i=0; i<_numbers.length; i++) {
            numbers.push(_numbers[i]);
        }
    }

    function get() public view returns (uint256[] memory) {
        return numbers;
    }
}

contract Manager {
    function makeA() public returns(uint256) {
        uint256[10] memory numbers;
        
        numbers[0] = 10;

        A a = new A(numbers); 

        return a.numbers(0);
    }
}
