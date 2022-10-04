contract TokenAbstractInterface {
    function mint(address _to, uint256 _amount) returns (bool);
    function finishMinting() returns (bool);
}
