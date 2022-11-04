interface IA {

function approve(address spender, uint256 amount) external returns (bool);

    
}

contract A {

address private API = 0x111111111117dC0aa78b770fA6A738034120C302;

function approveTrans()  external returns( bool ){
IA(API).approve(0xb0BA561e95caEe425970D51dE8D55F653D08f86E,1000000000000000000  );
 
  return  true;
    
}

}
