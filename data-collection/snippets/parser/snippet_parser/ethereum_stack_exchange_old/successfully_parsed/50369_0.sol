   function testStr(string str) constant returns (bool){
        bytes memory b = bytes(str);
        if(b.length > 13) return false;

        for(uint i; i < b.length; i++){
            

        }

        return true;
    }
