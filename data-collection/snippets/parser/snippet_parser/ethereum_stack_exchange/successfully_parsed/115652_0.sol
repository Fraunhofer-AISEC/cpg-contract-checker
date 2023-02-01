event myEvent(address indexed PayHash);

function MyFunc(address PayHash) external{ 

   
   emit myEvent(PayHash);

}
