MyStruct[] myStructArray;

function checkArray() constant returns(bool[]){ 

    bool[] checker; 

    for(uint i = 0; i<myStructArray.length; i++){
        if(myStructArray[i].foo == bar){
            checker[i]=true; 
        }
        else{
            checker[i]=false;
        }
    }
    return checker;
}
