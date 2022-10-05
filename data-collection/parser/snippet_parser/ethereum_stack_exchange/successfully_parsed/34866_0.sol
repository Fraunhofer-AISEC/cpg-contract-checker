function createBar(uint barNum)
  public
  returns (uint)
{
  uint barId = bars.length;
  bars.length += 1;
  bars[barId].barNum = barNum;
  return barId;
}
