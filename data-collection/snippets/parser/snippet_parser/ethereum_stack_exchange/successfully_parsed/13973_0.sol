pragma solidity ^0.4.0;





contract queue
{
    struct Queue {
        uint256[] data;
        uint256 front;
        uint256 back;
    }
    
    function length(Queue storage q) constant internal returns (uint256) {
        return q.back - q.front;
    }
    
    function capacity(Queue storage q) constant internal returns (uint256) {
        return q.data.length - 1;
    }
    
    function push(Queue storage q, uint256 data) internal
    {
        if ((q.back + 1) % q.data.length == q.front)
            return; 
        q.data[q.back] = data;
        q.back = (q.back + 1) % q.data.length;
    }


    
    function pop(Queue storage q) internal returns (uint256 r)
    {
        if (q.back == q.front)
            return; 
        r = q.data[q.front];
        delete q.data[q.front];
        q.front = (q.front + 1) % q.data.length;
        return r;
    }
    Queue requests;
    event PopEvent(bool ok); 
    function queue() {
        requests.data.length = 200;
    }
    function addRequest(uint256 d) {
        push(requests, d);
    }
    function popRequest()  returns (uint256) {
        PopEvent(true);
        return pop(requests);
    }
    function queueLength()  constant returns (uint256) {
        return length(requests);
    }
    function hello() constant returns(string s){ 
        return 'hello world!';
    }
}
