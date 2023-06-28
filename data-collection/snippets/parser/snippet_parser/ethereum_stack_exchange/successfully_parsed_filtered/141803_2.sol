 struct Test{
       uint a;
       uint b;
       uint c;
       uint d;
   }
   mapping(string => Test) public serialID;
   function set(string memory _id){
      Test storage test = Test(1, 2, 3, 4);
      serialID[_id] = test;
   }
   
   function get(string memory _id) public view returns(uint, uint, uint, uint){

    return serialID[_id];
} 
