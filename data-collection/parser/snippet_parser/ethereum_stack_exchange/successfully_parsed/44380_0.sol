

contract Receiver {

function notify(uint count) returns(uint);

function getCurrentCounter() constant returns(uint);

}



contract Producer {

uint private count;
uint private subscriberCount;
mapping(uint => Subscriber) subscribers;
event CountIncreased(uint num);

struct Subscriber {
    string subscriberName;
    address subscriberAddress;
}

function Producer() {
    count = 0;
    subscriberCount = 0;
}

function increaseCount() returns(uint,address) {
    count++;
    Receiver receiver = Receiver(subscribers[0].subscriberAddress);
    receiver.notify(count);
    CountIncreased(count);
    return (count,subscribers[0].subscriberAddress);
}

function addSubscriber(string name, address subAddress) {
    subscriberCount++;
    subscribers[subscriberCount].subscriberName = name ;
    subscribers[subscriberCount].subscriberAddress = subAddress ;
}

function removeSubscriber(string subscriberName) {
    for (uint i=0; i<subscriberCount; i++) {
        Subscriber sub = subscribers[i];
        if(keccak256(sub.subscriberName) == keccak256(subscriberName)) {
            delete subscribers[i];
            subscriberCount--;
        }
    }

}


}
