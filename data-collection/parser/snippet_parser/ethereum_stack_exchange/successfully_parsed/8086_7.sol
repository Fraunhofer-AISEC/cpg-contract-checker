function findLogMix(uint b) returns (uint){
    
    uint up = 256;
    uint down = 0;
    uint attempt = (up+down)/2;
    while (up>down+4){
        if(b>=(2**attempt)){
            down=attempt;
        }else{
            up=attempt;
        }
        attempt=(up+down)/2;
    }
uint temp = 2**down;
while(temp<=b){
    down++;
    temp=temp*2;
}
return down;
}
