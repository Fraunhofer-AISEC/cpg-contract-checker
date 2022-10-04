    function parseAddr(string _a) internal returns (address){
     bytes memory tmp = bytes(_a);
     uint160 iaddr = 0;
     uint160 b1;
     uint160 b2;
     for (uint i=2; i<2+2*20; i+=2){
         iaddr *= 256;
         b1 = uint160(tmp[i]);
         b2 = uint160(tmp[i+1]);
         if ((b1 >= 97)&&(b1 <= 102)) b1 -= 87;
         else if ((b1 >= 48)&&(b1 <= 57)) b1 -= 48;
         if ((b2 >= 97)&&(b2 <= 102)) b2 -= 87;
         else if ((b2 >= 48)&&(b2 <= 57)) b2 -= 48;
         iaddr += (b1*16+b2);
     }
     return address(iaddr);
    }
