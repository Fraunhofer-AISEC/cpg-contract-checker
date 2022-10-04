uint[] all; 
mappings (uint => test) map;

function bla() {
    test memory structTest = test(5);
    all.push(10); 
    map[10] = structTest;
}
