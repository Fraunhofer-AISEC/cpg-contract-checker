pragma solidity >=0.4.22 <0.6.0;
contract HelloWorld {
    uint num;
    function get(uint val) public returns (string memory){
        num = val;
        return "Hello Solidity";
    }
}
