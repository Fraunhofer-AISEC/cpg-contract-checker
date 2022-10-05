contract str {
  uint[] x = [10];
  function useStore(uint[] storage y) internal view returns (uint) {
    return y[0];
  }
  function useMem(uint[] memory y) internal view returns (uint) {
    return y[0];
  }

  function efficient(uint n) external view returns (uint) {
    return useStore(x) + n;
  }
  function inefficient(uint n) external view returns (uint) {
    return useMem(x) + n;
  }  
}
