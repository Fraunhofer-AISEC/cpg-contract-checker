import "./IA.sol";

contract B {
    IA a;
    function b(address _aAddress, uint256 _a2) public returns(uint256) {
        a = IA(_aAddress);
        a.a2(_a2);
        return _a2;
    }
}
