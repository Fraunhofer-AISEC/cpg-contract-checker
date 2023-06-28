
struct Data {
  uint id;
  int val;
}

function returnData() external returns(Data memory);


event Data(uint indexed id, int val);

function emitData() external;
