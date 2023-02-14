public static final Event BUY = new Event(
  "Buy", Arrays.<TypeReference<?>>asList(
    new TypeReference<Address>(false) {}, 
    new TypeReference<String>(false) {}, 
  )
);  
