pragma solidity 0.4.18;

contract A {

    function aDo() public pure returns(bool success) {
        return true;
    }
}

contract B is A {

    function bDo() public pure returns(bool success) {
        return true;
    }

}
