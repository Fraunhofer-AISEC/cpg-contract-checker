bool breakOuterLoop = false;
for(uint8 i; i < 10; i++) {
    for (uint8 j; j < 10; j++) {
        if(myCondition) {
            breakOuterLoop = true;
            break; 
        }
    }
    if(breakOuterLoop) {
        break;
    }
}
