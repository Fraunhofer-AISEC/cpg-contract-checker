struct SomeStruct{
...
}

func(s *SomeStruct) Encode() ([]byte, error){
 typ := abi.MustNewType("tuple( ... )") 
 return abi.EncodePacked(s)
}



TestDecode(bytes memory data) public{
  SomeStruct memory strc = Decode(data)
  ...
}
