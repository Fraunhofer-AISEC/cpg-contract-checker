contract X {
   function a() pure public returns(uint,uint) {
       uint p=10;
       uint q=20;

       uint add = p+q;
       uint sub = q-p;

       return(add,sub);
   }
}
