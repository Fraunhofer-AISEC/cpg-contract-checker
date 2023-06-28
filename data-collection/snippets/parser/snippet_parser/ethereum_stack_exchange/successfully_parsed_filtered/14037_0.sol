function getMsgData(
  address _address,
  bytes _bytes,
  uint _int,
  uint[] _array,
  string _string
 )
  external
  returns (bytes)
 {
   return msg.data;
 }
