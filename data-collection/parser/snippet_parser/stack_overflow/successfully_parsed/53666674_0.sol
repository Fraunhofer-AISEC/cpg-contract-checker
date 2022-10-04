pragma solidity ^0.4.25;

import "./TokenERC20.sol";

contract TradingBook is Pausable {


struct Deal {
  string dealNo;
  string price;
  string buyer;
  string seller;
} 


Deal[] public arrDeals;


function recordDeal(string _dealNo, string _price, string _buyer, string _seller) onlyOwner external {
    Deal memory newData = Deal(_dealNo, _price, _buyer, _seller);
    arrDeals.push(newData);
}

function getDeals() external view returns(string) {
    string memory str = new string(256 * arrDeals.length);

    for(uint i=0; i<arrDeals.length; i++){
        str = "{";
        str = _strConcat(str, "\"dealNo\":\"", arrDeals[i].dealNo, "\",");
        str = _strConcat(str, "\"price\":\"", arrDeals[i].price, "\",");
        str = _strConcat(str, "\"buyer\":\"", arrDeals[i].buyer, "\",");
        str = _strConcat(str, "\"seller\":\"", arrDeals[i].seller, "\"}");
    }
    return str;
}


function _strConcat(string _a, string _b, string _c, string _d, string _e) internal pure returns (string){
    bytes memory _ba = bytes(_a);
    bytes memory _bb = bytes(_b);
    bytes memory _bc = bytes(_c);
    bytes memory _bd = bytes(_d);
    bytes memory _be = bytes(_e);
    string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length);
    bytes memory babcde = bytes(abcde);
    uint k = 0;
    for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
    for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
    for (i = 0; i < _bc.length; i++) babcde[k++] = _bc[i];
    for (i = 0; i < _bd.length; i++) babcde[k++] = _bd[i];
    for (i = 0; i < _be.length; i++) babcde[k++] = _be[i];
    return string(babcde);
}

function _strConcat(string _a, string _b, string _c, string _d) internal pure returns (string) {
    return _strConcat(_a, _b, _c, _d, "");
}

function _strConcat(string _a, string _b, string _c) internal pure returns (string) {
    return _strConcat(_a, _b, _c, "", "");
}

function _strConcat(string _a, string _b) internal pure returns (string) {
    return _strConcat(_a, _b, "", "", "");
}
}