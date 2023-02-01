pragma solidity ^ 0.8.6;

contract UselessWorker {

    uint32 public successfullyExecutedIterations = 0;


    mapping (uint32 => uint32 [6]) items;
    
    event ItemAdded (uint32 result);
    
    function doWork (int _iterations) public {
        for (int32 i = 0; i <_iterations; i ++) {
          items [successfullyExecutedIterations] = [uint32 (block.timestamp), successfullyExecutedIterations, 10, 10, 10, 10];
          successfullyExecutedIterations ++;
        }
        emit ItemAdded (successfullyExecutedIterations);
    }
}
