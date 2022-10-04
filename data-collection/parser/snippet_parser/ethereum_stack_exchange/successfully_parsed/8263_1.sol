library L {

    function add(uint256 a, uint256 b) returns (uint256) {
        return a + b;    
    }

}

contract C {

    function thatAdd(uint256 a, uint256 b) returns (uint256) {
        return L.add(a, b);
    }

    function thisAdd(uint256 a, uint256 b) returns (uint256) {
        return a + b;
    }

}
