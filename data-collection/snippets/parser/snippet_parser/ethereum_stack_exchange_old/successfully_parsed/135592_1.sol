contract myarray {

    uint[][] ipadAirPrice = [[uint(1200),1400,1600,1800],[uint(8),6,8,4]];

    function addElement(uint256 subArrayIndex, uint256 element) public {
        ipadAirPrice[subArrayIndex].push(element);
    }

    function getElements() public view returns(uint[][] memory) {
        return ipadAirPrice;
    }
    
}
