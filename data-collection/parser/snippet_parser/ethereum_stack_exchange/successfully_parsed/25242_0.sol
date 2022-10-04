string sentence;
string more_text;

function AddTwoStrings(){
    sentence = "this is a sentence";
    more_text = " additional text added.";
}


function add_string() returns (string str){
    str = sentence + more_text; 
    return str;
}
