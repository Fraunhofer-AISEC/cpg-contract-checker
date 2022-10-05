pragma solidity ^0.4.18;
contract URP {

    uint8 x1; 
    uint8 x2;
    uint8 y1;
    uint8 y2;
    uint8 z1;
    uint8 z2;
    uint8 retailer; 
    uint8 value; 
    uint8 x; 
    uint8 y; 
    uint8 z;
    uint8 shopper;

function SendCoin(uint8 _x1, uint8 _x2, uint8 _y1, uint8 _y2, uint8 _z1, uint8 _z2, uint8 _ret, uint8 _value, uint8 _x, uint8 _y, uint8 _z, uint8 _shop) public {
       x1 = _x1;
       x2 = _x2;
       y1 = _y1;
       y2 = _y2;
       z1 = _z1;
       z2 = _z2;
       retailer = _retailer;
       value = _value;
       x = _x;
       y = _y;
       z =_z;
       shopper = _shopper;
   }

   function getSendCoin() public constant returns (uint8, uint8, uint8, uint8, uint8, uint8, uint8, uint8, uint8, uint8, uint8, uint8) {
       return (x1, x2, y1, y2, z1, z2, retailer, value, x, y, z, shopper);
   }  
}
