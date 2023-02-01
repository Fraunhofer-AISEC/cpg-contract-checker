function getRate() constant internal returns(uint) {
    if (START + 1 weeks > now) {
            return 1000; 
    } else if (START + 2 weeks > now) {
            return 750; 
    } else if (START + 3 weeks > now) {
            return 500; 
    } else {
            return 250;
    }
  }
