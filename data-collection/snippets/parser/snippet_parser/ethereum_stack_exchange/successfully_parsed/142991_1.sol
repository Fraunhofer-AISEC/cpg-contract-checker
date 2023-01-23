interface IContractA {
 uint public x;
}

contract B {

    function getContractAState() public returns (uint256){
        IContractA contractA = IContractA(contractAAddress);
        uint256 y = contractA.x()
        return y;
    }
}
