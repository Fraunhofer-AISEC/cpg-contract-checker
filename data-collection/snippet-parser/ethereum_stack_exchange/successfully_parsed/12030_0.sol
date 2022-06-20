
contract dataStorage {
    function getBalanceOf(address _account) constant returns (uint256 balance);
    function setBalanceOf(address _account, uint256 _value);
}
