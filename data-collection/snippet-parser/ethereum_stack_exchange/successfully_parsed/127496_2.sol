function referee() internal view returns (address user) {
    assembly { user := sload(CTRL) }
}

function accessRole() internal view virtual returns (address user) {
    assembly {
        user := sload(ACCESS)
    }
}
