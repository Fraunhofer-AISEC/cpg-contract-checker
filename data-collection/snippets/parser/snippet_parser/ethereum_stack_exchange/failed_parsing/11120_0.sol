contract old{
    struct Student{
        bytes32 name;
        uint age;
    }
    uint public sno = 0;
    mapping (uint => Student) pupil;
    function input(bytes32 n, uint a){
        <Student updated>
    }
    function output() constant returns(bytes32[], uint[], uint){
        bytes32[] memory n = new bytes32[](sno);
        uint[] memory a = new uint[](sno);
        for(uint i=0; i<sno; i++){
            Student s = pupil[i+1];
            n[i] = s.name;
            a[i] = s.age;
        }
        return(n,a,sno);
    }
}


contract receiver{
    old o;
    struct Student1{
        bytes32 name1;
        uint age1;
    }
    uint public sno1 = 0;
    mapping (uint => Student) pupil;
    function set(){
      ........
    }
}
