pragma solidity ^0.4.23;


contract ArrayTes {

    uint256 public l;

    function secfun(uint256 a) public view returns(uint256) {

        l = l+a;
        return l;
    }
}


contract CallFunction {

    ArrayTes at;

    function CallFunction(address _t) {
        at = ArrayTes(_t);
    }

    function thirdfun(uint256 a) public view returns(uint256 c) {

        c = at.secfun(a);
        return c;
    }

}
