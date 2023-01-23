function bytes2uint(bytes _data) constant returns(uint){
    uint i=0;
    uint dec=0;

    for (i = 0; i < _data.length; i++) {
        byte e=_data[_data.length-i-1];
        uint f=uint(e);
        f=((f/16)*10)+(f%16);
        dec+=(f*(100**i));
    }
    return dec;
}
