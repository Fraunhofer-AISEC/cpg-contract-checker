uint256 balance = address(this).balance;
bool hs;
(hs, ) = payable(...).call{value: balance * 35 / 100}("");
require(hs);
(hs, ) = payable(...).call{value: balance * 15 / 100}("");
require(hs);

