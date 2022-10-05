function uint_to_bytes (uint value) internal pure returns (bytes memory)
{
    uint byte_count = value <= 255 ? 1 : 2;
    bytes memory slot_contents = new bytes (byte_count);

    uint content_index = 0;
    bool value_started = false;
    for (int16 b = 31; b >= 0; b--)
    {
        uint a = uint (b);
        uint shift = a * 8;
        uint anded_value = (0xff << shift) & value;
        uint8 this_byte = uint8 (anded_value >> shift);

        if (this_byte > 0)
            value_started = true;

        if (value_started)
            slot_contents [content_index++] = byte (this_byte);
    }

    return slot_contents;
}
