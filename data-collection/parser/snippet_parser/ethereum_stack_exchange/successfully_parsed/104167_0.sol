pragma solidity >=0.7.0 <0.9.0;


 library lib {
      event check(bool, bytes);

      function remoteCall(address c) internal
      {
           (bool success, bytes memory data) = c.call(abi.encodeWithSignature("callback(bool)", true));
            emit check(success, data);
      }
  }

  contract main{
     using lib for *;
     event test(bool);

     function useCallBack() external{
         lib.remoteCall(address(this));
     }

     function callback(bool b) internal {
         emit test(b);
     }

 }
