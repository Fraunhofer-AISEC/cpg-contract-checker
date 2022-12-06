 contract basicStorage {
     uint storedData;

     function set(uint x) {
        storedData = x;
     }

     function get() constant returns (uint) {
        return storedData;
     }
 }
