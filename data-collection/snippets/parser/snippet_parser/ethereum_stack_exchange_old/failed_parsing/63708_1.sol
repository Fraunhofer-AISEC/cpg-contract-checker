  struct Queue {
        uint128 start;
        uint128 end;
        mapping(uint128 => uint256) items;
    }

    event returnn(uint256 item);

    Queue myQueue;


    function enqueue(uint256 item) external{
        myQueue.items[myQueue.end++] = item;
    }

    function dequeue() external {
        require (myQueue.start < myQueue.end);
        uint256 item = myQueue.items[myQueue.start];
        myQueue.items[myQueue.start++] = 0;
        emit returnn(item);
    }
