pragma solidity ^0.8.4;

contract Test {
     uint[] public house = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    
    function sugMa() public view returns (uint) {
        uint even = 0;
        for (uint i = 0; i <= house.length; i++) {
            if (i % 2 == 0) {
                even += 1;
            }
        }
        return even;
    
    }

}
