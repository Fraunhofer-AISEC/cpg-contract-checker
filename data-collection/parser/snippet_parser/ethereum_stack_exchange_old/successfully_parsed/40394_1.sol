var constructor = (new Deed);
var constructorWithValue = constructor.value(msg.value);
Deed newBid = constructorWithValue(msg.sender);
