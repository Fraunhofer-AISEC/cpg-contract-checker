function _fallback() internal {
    _willFallback();
    _delegate(_implementation());
  }
