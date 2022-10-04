function lookup(uint256 index) private pure returns (uint256 stat) {
    assembly {
        switch index
        case   0 { stat :=  0 }
        case   1 { stat :=  1 }
        case   2 { stat :=  1 }
        case   3 { stat :=  2 }
        case   4 { stat :=  2 }
        case   5 { stat :=  2 }
        case   6 { stat :=  3 }
        case   7 { stat :=  3 }
        case   8 { stat :=  3 }
        case   9 { stat :=  3 }
        case  10 { stat :=  4 }
        case  11 { stat :=  4 }
        case  12 { stat :=  4 }
        case  13 { stat :=  4 }
        case  14 { stat :=  4 }
        case  15 { stat :=  5 }
        case  16 { stat :=  5 }
        case  17 { stat :=  5 }
        case  18 { stat :=  5 }
        case  19 { stat :=  5 }
        
        default  { stat := 20 }
    }
}
