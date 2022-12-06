pragma solidity ^0.4.22;
contract sample{
address owner=0x1234;    
uint32 firstTimeUserPoints=10;
struct struUser{
    bytes32 orginalName;
    bytes32 originalKshoplink;
    bytes32 orginalDocumentConvention;
    bool validated;
    uint32 Points;
    uint32 totalPoints;
}
struct struUserTotalPoints{
    bytes32 orginalName;
    uint32 totalPoints;
}

mapping(bytes32=>struUser)bytesMappingToken;
struUser[] struUsers;
struUserTotalPoints[] struArrayUserTotalPoints;
string[] docConventionMappers;
string[] orginalName;
event printAddUserSuccess(string message);
event viewUser(string username, uint32 totalpoints);

modifier isOwner() {
    
    require (msg.sender == owner) ;
    _;
}



function AddUser(string namestring,string linkstring,string docConventionstring) public{

    


    bytes32 name=keccak256(abi.encodePacked(namestring));
    bytes32 link=keccak256(abi.encodePacked(linkstring));
    bytes32 docConvention=keccak256(abi.encodePacked(docConventionstring));
    uint32 existingTotalPoints=userTotalPoints(name);
     var user=bytesMappingToken[name];
    user.orginalName=name;
    user.originalKshoplink=link;
    user.validated=false;
    user.Points=firstTimeUserPoints;
    user.totalPoints=existingTotalPoints+firstTimeUserPoints;
    updateUserTotalPoints(name,user.totalPoints);
    user.orginalDocumentConvention=docConvention;
    struUsers.push(user);
    

    
    
    

    

    
    emit printAddUserSuccess("user added successfully!");

}


 function userTotalPoints(bytes32 name) public returns(uint32){  

     bool isUserTotalPointsCalculated=false;

        for(uint j=0;j<struArrayUserTotalPoints.length;j++){
            
            if(comparebytes(struArrayUserTotalPoints[j].orginalName,name)){
                isUserTotalPointsCalculated=true;
                return struArrayUserTotalPoints[j].totalPoints;
            }
        }
        if(!isUserTotalPointsCalculated){
            struArrayUserTotalPoints.push(struUserTotalPoints({orginalName:name,totalPoints:firstTimeUserPoints}));
            return 0;                
        }  
}

function userexists(string namestring) view public returns(uint32){
    bytes32 name=keccak256(abi.encodePacked(namestring));
     for(uint j=0;j<struArrayUserTotalPoints.length;j++){
            if(comparebytes(struArrayUserTotalPoints[j].orginalName,name)){
               return bytesMappingToken[name].Points;
            }
        }
        return 5;
}

   function comparebytes (bytes32 a, bytes32 b) pure public returns (bool){
   
   return keccak256(abi.encodePacked(a))==keccak256(abi.encodePacked(b));
   }


function viewuser(string name)public returns(string,uint32,uint32){ 
    bytes32 bytesname=keccak256(abi.encodePacked(name));
    uint32 totalpoints=userTotalPoints(bytesname);
    return (name,bytesMappingToken[bytesname].Points,totalpoints);
}

function updateUserTotalPoints(bytes32 name,uint32 totalPoints) public{
    for(uint j=0;j<struArrayUserTotalPoints.length;j++){
            if(comparebytes(struArrayUserTotalPoints[j].orginalName,name)){
                struArrayUserTotalPoints[j].totalPoints=totalPoints;
            }
        }
}


function () public payable {

}
}
