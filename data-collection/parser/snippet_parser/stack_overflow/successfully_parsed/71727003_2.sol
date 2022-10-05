
contract CostTest_0 {
    uint8[] public arr_0 = [0,0,0];
    
}


contract CostTest_1 {
    uint8[] public arr_1 = new uint8[](3);  
}


contract CostTest_2 {
    uint8[] public arr_0 = [0,0,0];     
    uint8[] public arr_1 = new uint8[](3);  
    
    
    function f() public {
        arr_0.push(100);
    }

    
    function g() public {
        arr_1.push(100);
    }
    
    function h(uint256 idx) public view returns (uint8) {
        return arr_0[idx];
    }
    
    function i(uint256 idx) public view returns (uint8) {
        return arr_1[idx];
    }


    
    function p(uint256 idx) public pure returns (uint8) {
        uint8[] memory tmp = new uint8[](3);
        return tmp[idx];
    }
    
    function q(uint256 idx) public pure returns (uint8) {
        uint8[3] memory tmp = [0, 0, 0];  
        return tmp[idx];
    }
}
