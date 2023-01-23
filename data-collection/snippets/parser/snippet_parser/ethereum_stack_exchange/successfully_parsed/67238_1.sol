pragma solidity ^0.5.4;

contract A{
    struct test{
        string  testString;
    }
    test[] tests;

    constructor() public {
        tests.push(test("aaa"));
        tests.push(test("bbb"));
        tests.push(test("ccc"));
    }

    function getteststring(uint256 index)public view returns (string memory){
        return tests[index].testString;        
    }
}
