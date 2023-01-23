struct User {
    address user;
    bool paid;
}

mapping(string => User) PremiumUsers;
address owner;


function Premium() {
    owner = msg.sender;
}

function () {
  var mail = byteconverterToString(msg.data);
  var newUser = PremiumUsers[mail];
  newUser.user = msg.sender;
  newUser.paid = true;
}
