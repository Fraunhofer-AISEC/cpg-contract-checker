struct Structure {
    string _var;
}

Structure[] structure;

function addStructure(string _var) {
    Structure _s = Structure(_var);
    ->> structure.push(_s);
}
