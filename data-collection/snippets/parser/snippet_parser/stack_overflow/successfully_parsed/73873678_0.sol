function test(bytes calldata d) external view returns (C calldata c) {
    assembly {
        c.offset := d.offset
    }
}
