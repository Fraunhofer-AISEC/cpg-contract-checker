void wagTail(Animal animal) {
  if (animal instanceof Dog) {
    animal = (Dog)animal;
    animal.wagDogTail();
  } else if (animal instance of Cat) {
    animal = (Cat)animal;
    animal.wagCatTail();
  }
}
  
