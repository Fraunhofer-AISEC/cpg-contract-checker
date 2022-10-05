

pragma solidity >=0.7.0 <0.8.0;

contract AverageStream {

    uint private count;
    uint private pre_average;

    constructor() {
        count = 0;
        pre_average = 0;
    }
    
    function add_element(uint num) public {
        count += 1;
        pre_average += num;
    }
    
    function get_average() public view returns (uint) {
        return uint(pre_average) / uint(count);
    }
    
}
