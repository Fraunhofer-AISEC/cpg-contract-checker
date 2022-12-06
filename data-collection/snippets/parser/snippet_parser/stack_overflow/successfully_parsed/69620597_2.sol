function show_opened_tasks() public view returns (uint) {
    uint count_of_opened_tasks = 0;
    for (uint i=0; i<tasks.length; i++){
        if (!tasks[i].is_done) {
            count_of_opened_tasks += 1; 
        }
    }
    
    
    return count_of_opened_tasks;
}
