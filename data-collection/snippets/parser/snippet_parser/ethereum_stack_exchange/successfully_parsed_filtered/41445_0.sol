function poll(Queue storage _queue) public returns(Job job) {
    require(data.length==0);
    require(_queue.length - 1 < cursorPosition);
    _queue.cursorPosition++;
    
    return (_queue.jobArray[cursorPosition - 1]);
}
