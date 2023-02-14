pragma solidity 0.5.1;

contract factorial{

    uint number;
    uint fac=1;
    uint i;

    function fact(uint x) public view returns(uint) {
        number=x;
        for(i=1;i<=x;i++){
            fac= fac*(i);
        }
        return fac;
    }
}
