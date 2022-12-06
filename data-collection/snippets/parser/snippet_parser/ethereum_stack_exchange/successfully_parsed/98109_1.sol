contract Layer2{
    address addressOrigin;
    function setAddressOrigin(address _addressOrigin) external {
        addressOrigin = _addressOrigin;
    }
    function callinvest() external payable{
        Origin origin = Origin(addressOrigin);
        origin.invest();
        
    }
}
