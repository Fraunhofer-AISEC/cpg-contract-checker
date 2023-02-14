function setwinner() internal returns(address){
        for (uint stime = 0 ; stime < squareStartTimeArray.length; stime++ & uint etime = 0; etime = squareEndTimeArray.length etime++) {
            if (winningTime >= stime & winningTime <= etime) {
                winningIndex = stime;
                if (assert(stime == etime) == true) {
                    winningAddress = playerArray[stime];
                }
            }
        }
    }
