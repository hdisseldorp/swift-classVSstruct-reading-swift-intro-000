//: Playground - noun: a place where people can play

import UIKit
import Foundation

//: ### Question 1
//: Given this class that represents a giant:
class Giant {
  var name: String
  var weight: Double
  // Initialy is was 'let homePlanet: String'
  // Had to change it to comply to Question 2
  var homePlanet: String
  
  init(name: String, weight: Double, homePlanet: String) {
    self.name = name
    self.weight = weight
    self.homePlanet = homePlanet
  }
}

let fred = Giant(name: "Fred", weight: 340.0, homePlanet: "Earth")

//: Will these three lines of code run?
fred.name = "Brick"
fred.weight = 999.2
fred.homePlanet = "Mars"

//: ### Answer:
//: __No__, because homePlanet is a '__let__' constant and therefore __cannot__ be _mutated_.
//: * * *
//: ### Question 2
//: Can you fix the class definition above so that it does work?

//: ### Answer:
//: Change **_let_** homePlanet: String   into   **_var_** homePlanet: String
//: * * *
//: ### Question 3
//: Take a look at this struct that represents an alien:
struct Alien {
  var name: String
  var height: Double
  var homePlanet: String
}

var bilbo = Alien(name: "Bilbo", height: 1.67, homePlanet: "Venus")

//: Will these three lines of code run?
bilbo.name = "Jake"
bilbo.height = 1.42
bilbo.homePlanet = "Saturn"
//: ### Answer:
//: This code wil __NOT__ run, because _bilbo_ is a __let__ constant and therefore __cannot__ be _mutated_.
//: * * *
//: ### Question 4
//: Can you change the declaration of _bilbo_ so that the above three lines of code do work?

//: ### Answer:
//: Change **_let_** bilbo    into   **_var_** bilbo
//: * * *
//: ### Question 5
//: Consider this bit of code that uses the Giant class:
let edgar = Giant(name: "Edgar", weight: 520.0, homePlanet: "Earth")
let jason = edgar
jason.name = "Jason"
//: What will the value of edgar.name be after those three lines of code are run? What will the value of jason.name be? Why?

//: ### Answer:
//: The value of _edgar.name_ is __Jason__. The value of _jason.name_ is the same as _edgar.name_ (__Jason__). Because _jason_ is a reference to _edgar_ and points to the same object. (Classes are __reference__ types)
//: * * *
//: ### Question 6
//: Given this bit of code that uses the Alien struct:
var charles = Alien(name: "Charles", height: 2.25, homePlanet: "Pluto")
var charlesFromJupiter = charles
charlesFromJupiter.homePlanet = "Jupiter"
//: What will the value of charles.homePlanet be after the above code run? What about the value of charlesFromJupiter.homePlanet? Why?

//: ### Answer:
//: The value of _charles.homePlanet_ will be __Pluto__. The value of _charlesFromJupiter.homePlanet_ will be __Jupiter__. Because _charlesFromJupiter_ is a __COPY__ of _charles_ and any changes made to the _copy_ will not reflect the original _charles_. (Structs are __value__ types)
print("Answer question 6:")
print("  charles.homePlanet = \(charles.homePlanet)")
print("  charlesFromJupiter.homePlanet = \(charlesFromJupiter.homePlanet)")
//: * * *
//: ### Question 7
//: Here's a struct that represents a bank account:
struct BankAccount {
  var owner: String
  var balance: Double

  // func deposit(_ amount: Double) {
  mutating func deposit(_ amount: Double) {
    balance += amount
  }
  
  // func withdraw(_ amount: Double) {
  mutating func withdraw(_ amount: Double) {
    balance -= amount
  }
}
//: Does this code work? Why or why not?
//: ### Answer:
//: This code does __NOT__ work. Because the methodes _deposit_ and _withdraw_ are not defined as __mutating__. A Struct can only change their properties with methodes which are marked _mutating_.
//: * * *
//: ### Question 8
//: Can you fix the BankAccount struct so it does work?
//: ### Answer:
//: __mutating__ *func deposit(_ amount: Double) {*

//: __mutating__ *func withdraw(_ amount: Double) {*
//: * * *
//: ### Question 9
//: Given this bit of code (which incorporates any fixes you made in Question 8):
var joeAccount = BankAccount(owner: "Joe", balance: 100.0)
var joeOtherAccount = joeAccount
joeAccount.withdraw(50.0)
//: What will the value of joeAccount.balance be after the above code runs? What about the value of joeOtherAccount.balance? Why?
//: ### Answer:
//: The value of _joeAccount.balance_ will be __50.0__. The value of _joeOtherAccount.balance_ will be __100.0__. Because before witdrawing __50.0__ from _joeAccount_ there was made a __copy__ to _joeOtherAccount_. When withdrawing or depositing to one of the instances the other instance is not changed.
print("Answer Question 9:")
print("  joeAccount.balance = \(joeAccount.balance)")
print("  joeOtherAccount.balance = \(joeOtherAccount.balance)")
//: * * *
//: ### Question 10
//: Here's a class that can track songs in a music library:
class MusicLibrary {
  var tracks: [String]
  
  init() {
    tracks = []
  }
  
  func add(track: String) {
    tracks.append(track)
  }
}
//: Given this bit of code that uses MusicLibrary:
let library1 = MusicLibrary()
library1.add(track: "Michelle")
library1.add(track: "Voodoo Child")
let library2 = library1
library2.add(track: "Come As You Are")
//: After this code runs, what are the contents of library1.tracks? What about the contents of library2.tracks? Why?
//: ### Answer:
//: The contents of _library1.tracks_ and _library2.tracks_ are the same. They both contain the tracks "Michelle", "Voodoo Child" and "Come As You Are". Because _library2_ is a reference to _library1_. Therefore all changes made to either one of the instances will also reflect the other instance.
//: * * *
print("Answer Question 10:")
print("  library1.tracks = \(library1.tracks)")
print("  library2.tracks = \(library2.tracks)")
