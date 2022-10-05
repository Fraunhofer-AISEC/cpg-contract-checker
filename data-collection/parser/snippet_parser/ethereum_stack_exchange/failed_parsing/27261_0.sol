contract sample {
     uint32 count;

     struct example {
         uint32 value ;
     }
     mapping(uint32=example) mapper;    
     event trackInt(uint32);
     event trackObj(uint32);

     function test() {
         example memory  obj;
         obj.value = count +1;
         mapper[count]=obj;
         count++;
         trackObj(obj.value);
         trackInt(count);

     }

     function getCount() returns (uint32) {
         return count;        
     }

     function get(uint32 id) returns (uint32) {

         example obj = mapper[id-1];
         return obj.value;
     }
}
