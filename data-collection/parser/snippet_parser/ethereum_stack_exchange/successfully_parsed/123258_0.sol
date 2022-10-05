pragma solidity >=0.8.0 <0.9.0;


contract a {
    event Log(string);
    constructor(string memory astr) {
        emit Log(astr);
    }
}

contract b is a {
    constructor(string memory bstr) a("aaaa") {
        emit Log(bstr);
    }
    
}
