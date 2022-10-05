pragma solidity ^0.4.6;

contract FIFO {

    uint[] public fifoQueue;
    uint public cursorPosition;

    function queueDepth()
        public
        constant
        returns(uint queueDepth)
    {
        return fifoQueue.length - cursorPosition;
    }

    function push(uint requestData) 
        public
        returns(uint jobNumber)
    {
        if(fifoQueue.length + 1 < fifoQueue.length) throw; 
        return fifoQueue.push(requestData) - 1;
    }

    function pop() 
        public
        returns(uint, uint)
    {
        if(fifoQueue.length==0) throw;
        if(fifoQueue.length - 1 < cursorPosition) throw;
        cursorPosition += 1;
        return (cursorPosition -1, fifoQueue[cursorPosition -1]);
    }
}

contract FifoClient {

    FIFO public jobQueue;

    event LogPush(address sender, uint jobNumber, uint jobValue);
    event LogPop (address sender, uint jobNumber, uint jobValue);

    function FifoClient() {
        
        jobQueue = new FIFO();
    } 

    function push(uint jobValue)
        public
        returns(uint jobNumber)
    {
        uint jobNum = jobQueue.push(jobValue);
        LogPush(msg.sender, jobNum, jobValue);
        return jobNum;
    }

    function pop() 
        public
        returns(uint, uint)
    {
        uint jobNum;
        uint jobVal;
        (jobNum, jobVal) = jobQueue.pop();
        LogPop(msg.sender, jobNum, jobVal);
        return(jobNum, jobVal);
    }

}
