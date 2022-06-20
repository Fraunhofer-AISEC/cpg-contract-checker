    abstract contract Base1 {
      uint256 val1;
      uint256[49] private ______gap;
    }
    
    abstract contract Base2 {
      uint256 val2;
      uint256[49] private ______gap;
    }
    
    contract Child is Base1, Base2 {
    
    }
