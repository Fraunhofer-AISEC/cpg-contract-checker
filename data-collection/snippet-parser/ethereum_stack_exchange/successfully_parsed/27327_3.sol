function checkNoExists (uint no) constant returns(bool){
    for(uint i=0; i<numbers.length; i++){
        if(numbers[i]==no){
            return true;
        }
    }
    return false;
}
