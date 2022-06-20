pragma solidity ^0.8.0;
    

    
contract Demo {
    uint256[] public numbers;
    
    function append(uint256 num) public {
        numbers.push(num);
    }
}
