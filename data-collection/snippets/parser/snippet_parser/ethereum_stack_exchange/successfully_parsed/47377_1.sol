pragma solidity 0.4.19;

contract Contract1{
    function simple() external view returns (bool) {
        return true;
    }
}

contract Contract2{
    bool public result;

    function Contract2(address contract1Address) public {
        Contract1 contract1 = Contract1(contract1Address);
        result = contract1.simple();
    }
}
