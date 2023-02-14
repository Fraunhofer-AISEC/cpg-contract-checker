contract Ceil {
    function ceil(uint a, uint m) constant returns (uint ) {
        return ((a + m - 1) / m) * m;
    }

    
    function ceil1(uint a, uint m) returns (uint ) {
        return ((a + m - 1) / m) * m;
    }
}
