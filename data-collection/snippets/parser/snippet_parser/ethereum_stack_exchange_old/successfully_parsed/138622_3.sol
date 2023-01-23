contract One is Utils {
    uint256 public var1;

    function setVar1(uint256 _var1) public {
        var1 = _var1;
    }

  function _authorizeUpgrade(address) internal virtual override onlyOwner {}

}
