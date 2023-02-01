contract MultipleValues2{

 function returnValues() public pure returns (uint, bool, uint256[3] memory) {
  return (23, true, [1,2,12300000200202020000002200200010100012002010102001020101020102222010122010012]);
 }
}
