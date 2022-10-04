
var service = new BeaconNodeService("http://localhost:19601/");
var client = BeaconNodeClientFactory.build(service);


var latch = new CountDownLatch(1);


var topics = EnumSet.allOf(BeaconEventType.class);


client.getEvents().onEvent(topics, event -> {
    System.out.println("Received event: " + event);
    latch.countDown();
});


latch.await();
