contract users{
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
    return adds.length;
}}
