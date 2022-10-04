
pragma solidity 0.8.1;

contract Storage{
    int number;
    function storePositive(int256 nump) public{
        number = nump;
    }
    function storeNegative(int256 numn) public{
        number = -numn;
    }
    function retreivep() public view returns(int256){
        return number;
    }
    function retreiven() public view returns(int256){
        return number;
    }
}
