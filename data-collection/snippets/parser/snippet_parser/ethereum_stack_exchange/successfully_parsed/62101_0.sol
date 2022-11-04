function resolveProject() {
    

    uint closedTask;
    uint totalPayout;

    for(uint i=0; i<taskIds.length; i++){
        if(tasks[taskIds[i]].status == 3) {
            
            closedTask = closedTask + 1;
            totalPayout += tasks[taskIds[i]].compensationOracle;
        }
    }
    
}
