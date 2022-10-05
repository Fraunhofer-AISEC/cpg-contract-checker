struct Person {
    string firstName;
    string lastName;
}

Person[3] public family;

constructor() {
    family[0] = Person("Will", "Smith");
    family[1] = Person("Jada", "Smith");
    family[2] = Person("Brad", "Pitt");
}
