interface WhatEver {
  function prize() external view returns(uint);
}

contract YourContract {
  function getPrize(address whateverAddress) public view returns(uint) {
    return WhatEver(whateverAddress).prize()
  }
}
