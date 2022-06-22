uint collateralFactor = 80;

function disburse(uint _amount, address _receiver) public payable {

      uint floorPrice = 100 ether

      uint loanAmount = floorPrice + (floorPrice * collateralFactor / 100);

      _receiver.call{value: loanAmount}("");
}
