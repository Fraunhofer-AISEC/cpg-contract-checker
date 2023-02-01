function getCardById(uint id) constant returns (uint idRet, string name, string email, string comment){

for (uint i = 0; i < count; i++) {

    if (cards[i].id == id) {

        idRet = cards[i].id;

        name = cards[i].name;

        email = cards[i].email;

        comment = cards[i].comment;

        return;

        }

    }
