function read_pc() public view returns (uint256 result) {
  assembly {
    result := verbatim_0i_1o(hex"58")
  }
}
