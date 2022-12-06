function refreshTopXOrdered(uint value) private {
    uint i = 0;
    
    for(i; i < topElementsOrdered.length; i++) {
        if(topElementsOrdered[i] < value) {
            break;
        }
    }
    
    for(uint j = topElementsOrdered.length - 1; j > i; j--) {
        topElementsOrdered[j] = topElementsOrdered[j - 1];
    }
    
    topElementsOrdered[i] =  value;
}
