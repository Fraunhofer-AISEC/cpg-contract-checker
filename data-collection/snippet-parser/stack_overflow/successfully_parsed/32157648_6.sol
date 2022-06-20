function concat(string _a, string _b) constant returns (string){
    bytes memory bytes_a = bytes(_a);
    bytes memory bytes_b = bytes(_b);
    string memory length_ab = new string(bytes_a.length + bytes_b.length);
    bytes memory bytes_c = bytes(length_ab);
    uint k = 0;
    for (uint i = 0; i < bytes_a.length; i++) bytes_c[k++] = bytes_a[i];
    for (i = 0; i < bytes_b.length; i++) bytes_c[k++] = bytes_b[i];
    return string(bytes_c);
}
