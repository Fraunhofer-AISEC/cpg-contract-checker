struct SomeStruct{
...
}

function Decode(bytes memory data) public pure returns(SomeStruct memory){
...
}

function TestDecode(bytes memory data) public{
  SomeStruct memory strc = Decode(data)
  ...
}
