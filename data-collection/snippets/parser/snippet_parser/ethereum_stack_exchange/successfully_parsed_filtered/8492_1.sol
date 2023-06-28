contract users{   
event LogThis(uint arg);
struct User{
    uint id;
    string str;
}
User [] public adds;
function del(){
    delete adds;
}
function delElem(uint i){
    delete adds[i];
}
function add(uint id,string cc){
    adds.push(User(id,cc));
}
function getLength()constant returns(uint){
    LogThis(adds.length);
    return adds.length;
}}
