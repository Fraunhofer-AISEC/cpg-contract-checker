struct Queue {
    uint128 start;
    uint128 end;
    mapping(uint128 => uint256) items;
}

Queue private myQueue;


function enqueue(Queue storage queue, uint256 item) internal {
    queue.items[queue.end++] = item;
}

function dequeue(Queue storage queue) internal returns (uint256) {
    uint256 item = queue.items[queue.start];
    queue.items[queue.start++] = 0;
    return item;
}
