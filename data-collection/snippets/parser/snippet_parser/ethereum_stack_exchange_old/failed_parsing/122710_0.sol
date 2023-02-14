import "./VRFv2Consumer.sol";
...

VRFv2Consumer vrf = new VRFv2Consumer(12345);
...

vrf.requestRandomWords();
uint256 randomWord = vrf.s_randomWords(0);
