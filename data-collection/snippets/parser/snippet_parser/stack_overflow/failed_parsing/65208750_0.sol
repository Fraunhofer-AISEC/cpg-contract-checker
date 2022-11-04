contract EthText {
  address payable public owner;
  ...
  constructor() public {
    owner = msg.sender;
