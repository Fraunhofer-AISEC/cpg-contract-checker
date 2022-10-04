contract game {

 struct users{
     string name;
     uint level;
     uint score;
 }

 mapping(uint => users[]) mulusers;

 function addusers (uint id, string _name, uint _level, uint _score) public {
     users memory user= users(_name,_level,_score); 
     mulusers[id].push(user);
 }

 function getusers (uint _id) public view returns (string){

    uint index= mulusers[_id].length;

     for(uint i=0; i<index; i++){       
       return mulusers[_id][i].name; 
     }   
  }   
}
