












function ln(int256 x) internal pure returns (int256 result) {
    
    
    unchecked { result = (log2(x) * SCALE) / LOG2_E; }
}
