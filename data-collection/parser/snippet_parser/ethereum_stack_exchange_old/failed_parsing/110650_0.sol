require(isContract(to), "Not a contract");

try IERC165(to).supportsInterface(0xabcdef) returns (bool supported) {
    
    require(supported, "Unsupported interface");
} catch (bytes memory ) {
    
    require(supported, "Unsupported ERC-165");
}
