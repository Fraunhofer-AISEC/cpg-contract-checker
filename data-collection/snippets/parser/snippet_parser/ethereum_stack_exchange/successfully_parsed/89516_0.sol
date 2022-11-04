   function increaseAge() internal {
     totalSupply += 1;
     balaceOf[owner] += 1;
   }

function triggerAgeCount() public {
    if ( (now-creationTime) >= 365 days ){
        increaseAge();
        creationTime = now;

    }
}

