contract Test {
  struct Data {
    uint256 first;
    uint256 second;
  }
  address public someAddress = 0x04068DA6C83AFCFA0e13ba15A6696662335D5B75;
  mapping(address => Data) public datas;

  constructor() {}

  function test(address[] memory users) external view {
    Data storage data;
    for (uint256 i = 0; i < users.length; i++) {
        if (users[i] == someAddress) {
            data = datas[someAddress];
            break;
        }
    }
  }
}
