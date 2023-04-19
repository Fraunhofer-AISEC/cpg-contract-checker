pragma solidity >=0.8.2 <0.9.0;

contract Storage {
    uint256 number = 5;

    function incP() public view returns(uint256) {
        return number;
    }

    function incE() external view returns(uint256) {
        return number;
    }
}
