function getLastTen(uint id) constant returns(uint[10], uint[10]){
    uint[10] memory lastX;
    uint[10] memory lastY;
    Foo[] storage arr = foo[id];
    uint len = arr.length;
    for(uint i=0;i<20;i++){
        if(len>i){            
            lastX[20 - 1 - i] = arr[len - 1 - i].x;
            lastY[20 - 1 - i] = arr[len - 1 - i].y;
        }
    }
    return (lastX, lastY);
}