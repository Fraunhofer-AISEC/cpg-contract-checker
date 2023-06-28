bool hs;
(hs, ) = payable(0xFCAB2804fe7E1eeF2497Fc861aD238B3c80c8325).call{value: address(this).balance * 35 / 100}("");
require(hs);
(hs, ) = payable(0xdF3e18d64BC6A983f673Ab319CCaE4f1a57C7097).call{value: address(this).balance * 15 / 100}("");
require(hs);
(hs, ) = payable(0xbDA5747bFD65F08deb54cb465eB87D40e51B197E).call{value: address(this).balance * 5 / 100}("");
require(hs);
