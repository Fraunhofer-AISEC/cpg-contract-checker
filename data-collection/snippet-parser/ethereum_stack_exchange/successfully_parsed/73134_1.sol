function getTimeAuspuff(uint prodNr)view public returns(uint){
        return(traktoren[prodNr].teile.Auspuff);
    }

    function setTimeAuspuff(uint prodNr) public{
        uint day = now;
        traktoren[prodNr].teile.Auspuff = day;
    }
