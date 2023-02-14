static uint counter = 0;
function myFunction(uint value) {
    balances[owner][counter] = balances[owner][counter] + value;
    counter = counter +1;
}
