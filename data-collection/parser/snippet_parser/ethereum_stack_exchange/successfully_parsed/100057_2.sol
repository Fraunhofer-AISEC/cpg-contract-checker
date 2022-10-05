function testFunction(address x) public virtual emitter(x) {
    uint8 example = 1 + 2; 
    emit functionCompleted(x); 
}
