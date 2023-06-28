



function ectest(bytes32 hash, bytes sig) returns (bool) {
    bytes32 r;
    bytes32 s;
    uint8 v;

    if (sig.length != 65)
      return (false, 0);

    
    
    
assembly {
    r := mload(add(sig, 32))
    s := mload(add(sig, 64))

    
    
    
    v := byte(0, mload(add(sig, 96)))

    
    
    
    
}




if (v < 27)
  v += 27;

if (v != 27 && v != 28)
    return (false, 0);


if(isPoint(r,s) == false)
{
  return (false, 0);
}



e = sha3(msg);







      
      w  = invmod(s,n);
      
      u1 = (v * w) % n ;
      
      u2 = (r * w) % n;

      
      (x3,y3)=  ecmul(gx,gy,u1);
      (x4,y4)= ecmul(gx,gy,u2);

      (x1,y1) = ecadd(x3,y3,x4,y4);
      
      if (r == x1)
      {
        return (true);
      }
    }
