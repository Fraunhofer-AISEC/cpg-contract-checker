function myFun(uint256 val_, uint256 n) public pure returns (uint256[] results) {
     uint256 _num = uint256(keccak256(abi.encodePacked(val_)));
     uint256[] memory results = new int256[](n);

     for (uint256 i = 0; i < n; i++) {
         uint256 result = _countZeros(_num);
         results[i] = result * 125 - 160;
         _num = uint256(keccak256(abi.encodePacked(_num)));
     }
}
