function get_last_ten(uint id) public returns(uint[10]){
    uint[10] memory lastItems;
    for(uint i=0;i<10;i++){
        if(foo[id].length>i){
            lastItems[i] = foo[id][foo[id].length-i-1].x;
        }
    }
    return lastItems;
}
