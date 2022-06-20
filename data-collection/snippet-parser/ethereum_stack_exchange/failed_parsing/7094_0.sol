contract FilterByAddress {
    address[] addrs =  [0x36eaf79c12e96a3dc6f53426c, 0xf235aa56dd96bda02acfb361e];

    address controlAddr = 0x36eaf79c12e96a3dc6f53426c;

    function getSensitiveData() public return (string) {
         uint i = 0;
         for(i = 0; i < addrs.length; ++i) 
            if(msg.sender == addrs[i])
               return "You got the secret";
            else 
               return "You got nothing";
    }
}
