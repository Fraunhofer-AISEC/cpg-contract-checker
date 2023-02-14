bytes memory ret = new bytes(3);
ret[0] = 0x41; 
ret[1] = 0x42; 
ret[2] = 0x43; 
return string(ret); 
