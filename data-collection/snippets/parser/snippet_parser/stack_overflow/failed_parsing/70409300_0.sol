struct TestArr {
 uint256[] _numbers;
}
 
struct TestStruct {
  TestArr numbers;
}

_mapping[0] = TestStruct(
 TestArr(anArray)
)
