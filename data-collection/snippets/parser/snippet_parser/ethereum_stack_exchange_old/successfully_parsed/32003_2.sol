function concat(bytes memory self, bytes memory other)
returns (bytes memory) {
     bytes memory ret = new bytes(self.length + other.length);
     var (src, srcLen) = Memory.fromBytes(self);
     var (src2, src2Len) = Memory.fromBytes(other);
     var (dest,) = Memory.fromBytes(ret);
     var dest2 = dest + src2Len;
     Memory.copy(src, dest, srcLen);
     Memory.copy(src2, dest2, src2Len);
     return ret;
}
