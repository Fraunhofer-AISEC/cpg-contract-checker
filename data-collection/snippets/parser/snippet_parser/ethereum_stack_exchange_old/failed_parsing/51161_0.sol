    address private constant emergency_admin = 0x...;
    address private admin = 0x...;
      function emergency(address newa, bytes32 h, uint8 v, bytes32 r, bytes32 s,bytes32 h2, uint8 v2, bytes32 r2, bytes32 s2)
          public
        {
          
          require(h==prefixedHash2(newa));
          require(h2==prefixedHash2(newa));
          
          require(ecrecover(h, v, r, s)==admin);
          require(ecrecover(h2, v2, r2, s2)==emergency_admin);
          
          admin = newa;
        }
        function prefixedHash2(address message)
          private
          pure
          returns (bytes32)
        {
            bytes32 h = keccak256(message);
            bytes memory prefix = "\x19Ethereum Signed Message:\n32";
            bytes32 prefixedHashe = keccak256(prefix, h);
            return prefixedHashe;
        }
