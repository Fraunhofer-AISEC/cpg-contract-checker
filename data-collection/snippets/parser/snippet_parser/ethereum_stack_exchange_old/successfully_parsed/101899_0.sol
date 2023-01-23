pragma solidity >=0.7.0 <0.9.0;


interface ITest {
    function test(address addr) external view returns (address);
}

contract Test is ITest{
    mapping(address => address) public override test;
}
