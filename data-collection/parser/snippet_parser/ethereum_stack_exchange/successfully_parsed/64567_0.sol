function forward(address destination, bytes memory data) public { 
    (bool res, bytes memory retData) = destination.call(data);
    assert(res);
}
