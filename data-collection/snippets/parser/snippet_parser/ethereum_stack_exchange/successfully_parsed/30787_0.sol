function checkEven(uint testNo) constant returns(bool){
        uint remainder = testNo%2;
        if(remainder==0)
            return true;
        else
            return false;
    }
