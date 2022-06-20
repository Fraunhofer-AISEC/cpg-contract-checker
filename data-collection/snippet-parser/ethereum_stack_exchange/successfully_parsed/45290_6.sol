contract AInterface{}
contract BInterface{}
contract A is AInterface {
  BInterface b;
}
contract B is BInterface {
  AInterface a;
}
contract FactoryInterface {}
contract Factory is FactoryInterface {
  A a;
  B b;
}
