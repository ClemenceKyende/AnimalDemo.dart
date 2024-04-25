import 'dart:io';

// Interface
abstract class Animal {
  void makeSound();
}

// Parent class
class LivingBeing {
  void breathe() {
    print('Breathing...');
  }
}

// Child class inheriting from LivingBeing and implementing Animal interface
class Dog extends LivingBeing implements Animal {
  String name;

  Dog(this.name);

  @override
  void makeSound() {
    print('$name barks');
  }

  // Method to demonstrate the use of a loop
  void wagTail() {
    for (int i = 0; i < 3; i++) {
      print('$name is wagging tail...');
    }
  }
}

void main() {
  // Initializing an instance of Dog class with data from a file
  var dog = Dog.initializeFromFile('dog_data.txt');

  // Demonstrating overridden method
  dog.makeSound();

  // Demonstrating the use of a loop
  dog.wagTail();
}

extension DogInitialization on Dog {
  static Dog initializeFromFile(String fileName) {
    var file = File(fileName);
    var lines = file.readAsLinesSync();

    // Assuming the first line of the file contains the dog's name
    var dogName = lines[0];

    return Dog(dogName);
  }
}
