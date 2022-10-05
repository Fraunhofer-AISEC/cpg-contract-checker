function get_hash_block_uint (uint256 _a) public returns (uint32) 
{
    return uint32(block.blockhash(_a));
}
