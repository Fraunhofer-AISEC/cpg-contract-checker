 contract People {
      mapping(string => Person) myPeople;

      addPerson(string memory name, uint age) {
          Person person = new Person(name, age);
          myPeople[name] = person;
      }
 }
