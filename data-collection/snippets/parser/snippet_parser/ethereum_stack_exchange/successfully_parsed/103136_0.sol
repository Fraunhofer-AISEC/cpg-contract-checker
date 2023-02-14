bytes memory data = abi.encode(data1, data2);

(bytes memory data1_recovered, bytes memory data2_recovered) = abi.decode(data, bytes, bytes);
