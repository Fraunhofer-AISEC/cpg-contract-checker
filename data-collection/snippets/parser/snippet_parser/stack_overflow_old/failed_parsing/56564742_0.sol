function createVoucher(string val )public
   { var stud= VKey[val];
     isKey[val]=true;
     stud.key=val;
     stud.count=1 }

function isValid(string  val)public  view returns(bool){
    if(isKey[val] && isUsed[val]==false)
    {var stud=VKey[val];
     isKey[val]=false;
     stud.count=stud.count--;
     isUsed[val]=true;
    return  true;}

    else return false  }}
