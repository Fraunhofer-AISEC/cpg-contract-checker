function selectionW1(address subscribersW1, uint subscriberWheelW1) public  {

    require (subscriberWheelW1 == 1 && subscriberListW1.length < 2);
    subscriberListW1.push(subscribersW1);
    subscriberstructsW1[subscribersW1].W1 = subscriberWheelW1;

}
