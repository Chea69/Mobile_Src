import 'package:dart_lab3/dart_lab3.dart' as dart_lab3;

import 'dart:math';

void main() {
  // Exercise 1
  List<int> scores = [95, 82, 67, 91, 73, 58, 88, 45, 76, 99];
  Map<String, int> result = classifyScores(scores);
  print('Exercise 1 Output:');
  print(result);

  print('');

  // Exercise 2
  List<Shape> shapes = [Circle(5), Rectangle(4, 6), Triangle(3, 8)];

  print('Exercise 2 Output:');
  for (var shape in shapes) {
    print(shape.describe());
  }
}

// Exercise 1
Map<String, int> classifyScores(List<int> scores) {
  Map<String, int> grades = {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'F': 0};

  for (int score in scores) {
    String grade = switch (score) {
      >= 90 && <= 100 => 'A',
      >= 80 && < 90 => 'B',
      >= 70 && < 80 => 'C',
      >= 60 && < 70 => 'D',
      _ => 'F',
    };

    grades[grade] = grades[grade]! + 1;
  }

  return grades;
}

// Exercise 2
abstract class Shape {
  double area();
  String describe();
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return pi * radius * radius;
  }

  @override
  String describe() {
    return 'Circle (r=$radius): area = ${area().toStringAsFixed(2)}';
  }
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height;
  }

  @override
  String describe() {
    return 'Rectangle (${width.toInt()}x${height.toInt()}): area = ${area()}';
  }
}

class Triangle extends Shape {
  double base;
  double height;

  Triangle(this.base, this.height);

  @override
  double area() {
    return 0.5 * base * height;
  }

  @override
  String describe() {
    return 'Triangle (b=${base.toInt()}, h=${height.toInt()}): area = ${area()}';
  }
}
