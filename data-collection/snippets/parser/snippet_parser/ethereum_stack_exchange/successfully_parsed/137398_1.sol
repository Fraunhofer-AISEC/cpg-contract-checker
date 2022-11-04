interface IShop {
  function isSold() view external returns(bool);
  function buy() external;
}
