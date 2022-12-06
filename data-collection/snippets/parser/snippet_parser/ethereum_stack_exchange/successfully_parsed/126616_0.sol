uint[] public tab = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

function isEvenNumber(uint i) public view returns(bool) {

for(i=0; i < tab.length; i++) {
    return(tab[i] % 2 == 0);
}
}