function getData() constant returns (bytes32, bytes32, bytes32, bytes32, 
                                     bytes32, bytes32, bytes32, ...) {
    bytes32 a = "a";
    bytes32 b = "b";
    bytes32 c = "c";
    bytes32 d = "d";
    bytes32 e = "e";
    bytes32 f = "f";
    bytes32 g = "g";
    return (a, b, c, d, e, f, g, ...);
}
