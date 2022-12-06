contract IAddressManager {
    function getTokenAddress() public constant returns (address) {}
    function setTokenAddress(address _tokenAddress) public {}
    function getEventAddress(uint8 _indexOfAddress) public constant returns (address) {}
    function setEventAddress(uint8 _indexOfAddress, address _newContractAddress) public {}
    function getSpecialAddress(uint8 _indexOfAddress) public constant returns (address) {}
    function setSpecialAddress(uint8 _indexOfAddress, address _newContractAddress) public {}
}
