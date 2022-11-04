pragma solidity 0.4.24;

contract A {

    function methodA(string param) public pure returns(string) {
        
        return "Behold";
    }

}

contract B {

    A contractA;

    constructor() public {
        contractA = new A();
    }

    function callA(string param) public view returns(string) {
        string memory callResult=contractA.methodA(param);
        return callResult;
    }

}
