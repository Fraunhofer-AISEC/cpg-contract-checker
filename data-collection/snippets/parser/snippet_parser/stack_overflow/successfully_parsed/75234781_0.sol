
contract A {
    function X() public pure returns (string memory s) {
        s = 'Base contract function X';
    }
}

contract B is A {
    function Y() public pure returns (string memory s) {
        s = string.concat(X(), ' + Inherited contract function Y');
    }
}

contract C {
    A contractA = new A();
    function Z() public view returns (string memory s2) {
        s = string.concat(contractA.X(), ' + Contract C function Z');
    }
}
