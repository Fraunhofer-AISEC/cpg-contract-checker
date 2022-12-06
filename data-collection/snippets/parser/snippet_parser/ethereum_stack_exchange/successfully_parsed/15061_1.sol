   function testStr(string str) constant returns (bool){
        bytes memory b = bytes(str);
        if(b.length != 7) return false;
        for(uint i; i<7; i++){
            if(i==1){
                if(b[i] != 45) return false;
            }
            else if (i==4){
                if(b[i] != 58) return false;
            }
            else if(b[i] < 48 || b[i] > 57) return false;

        }

        return true;
    }
