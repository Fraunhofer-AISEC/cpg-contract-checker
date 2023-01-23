library Test{

  struct Data {
    mapping (bytes => string) a;
  }

  function inc(Data storage self) internal {
     self.a[0] = 'ban';
     self.a[1] = 'sam';
 }
}

contract Example{

  address recipient = 0x0000cafebabe;

  function getNames() view{
    Test.Data.a[0];
  }
}
