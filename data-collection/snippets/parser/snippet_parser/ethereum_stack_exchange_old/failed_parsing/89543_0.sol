for i, typ in enumerate(types):
    if sizes[i] is None:
        start_positions[i] = big_endian_to_int(data[pos:pos + 32])
        j = i - 1
        while j >= 0 and start_positions[j] is None:
            start_positions[j] = start_positions[i]
            j -= 1
        pos += 32
    else:
        outs[i] = data[pos:pos + sizes[i]]
        pos += sizes[i]
