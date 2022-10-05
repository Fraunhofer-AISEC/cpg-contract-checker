 address[] memory backerList = syndicate.getBackerList();

 if(syndicate.individualTotalBacking(msg.sender) == 0){

        uint index;

        for(uint i=0; i<backerList.length; i++){
            if (backerList[i] == msg.sender){
                index = i;
            }

        

            for(uint k=index; k<backerList.length-1; k++){
                backerList[k]=backerList[k+1];
            }

        }

        backerList.length--;
        syndicate.setBackerList(backerList);
    } else {}
