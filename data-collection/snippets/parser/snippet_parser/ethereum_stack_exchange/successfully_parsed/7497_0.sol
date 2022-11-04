contract C {

    address[] goodAddr;
    address[] badAddr;

    function initAddr() constant {

        if(goodAddr.length == 0) {
            goodAddr.push(0x029ddf2082bc96d321c9769ec8e27e10b3cb16ee);
        }

        if(badAddr.length == 0) {
            badAddr.push(0x115744603fedb255e5ab4765cc1dc6c832639fd5);
        }

        if(goodAddr.length == 1 && badAddr.length == 1) {
            return;
        }

        for(uint256 i = 0; i < goodAddr.length; i++) {
            if(goodAddr[i] == 0x029ddf2082bc96d321c9769ec8e27e10b3cb16ee)
                return;
        }

        for(i = 0; i < badAddr.length; i++) {
            if(badAddr[i] == 0x115744603fedb255e5ab4765cc1dc6c832639fd5)
                return;
        }

        goodAddr.push(0x029ddf2082bc96d321c9769ec8e27e10b3cb16ee);
        badAddr.push(0x115744603fedb255e5ab4765cc1dc6c832639fd5);
    }

    function getGoodAddr(uint256 i) constant returns (address) {
        if(i < 0 || i >= goodAddr.length) {
            return 0x0000000000000000000000000000000000000000;
        } else {
            return goodAddr[i];
        }
    }

    function getBadAddr(uint256 i) constant returns (address) {
        if(i < 0 || i >= badAddr.length) {
            return 0x0000000000000000000000000000000000000000;
        } else {
            return badAddr[i];
        }
    }
}
