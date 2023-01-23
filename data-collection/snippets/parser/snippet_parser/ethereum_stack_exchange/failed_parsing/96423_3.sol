function isPowerOfTen(uint256 x) external view returns (bool result) {
    assembly {
        switch x
        case 1 { result := true }
        case 10 { result := true }
        case 100 { result := true }
        case 1000 { result := true }
        case 10000 { result := true }
        case 100000 { result := true }
    }
}
