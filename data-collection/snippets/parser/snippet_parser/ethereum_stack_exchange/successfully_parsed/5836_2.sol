function ceil(uint a, uint m) returns (uint r) {
    return (a + m - 1) / m * m;
}
