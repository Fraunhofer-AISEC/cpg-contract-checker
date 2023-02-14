listeners.length += 1;
Listener storage listener = listeners[listeners.length - 1];
listener.user = msg.sender;
for (uint i = 0; i < tests.length; i++)
    listener.listened.push(tests[i]);
