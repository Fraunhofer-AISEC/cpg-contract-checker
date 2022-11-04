uint constant NO_MONEY = uint(0);

...

require(msg.value != NO_MONEY, "You have to send some ether.");
