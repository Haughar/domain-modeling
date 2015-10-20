//
//  main.swift
//  domain-modeling
//
//  Created by Alison Rose Haugh on 10/14/15.
//  Copyright © 2015 Alison Haugh. All rights reserved.
//

import Foundation

struct Money : CustomStringConvertible {
    var amount: Double;
    var currency: String;
    var description: String;
    
    init(amount: Double, currency: String) {
        self.amount = amount;
        self.currency = currency;
        self.description = currency + String(amount);
    }
    
    mutating func convert(new_currency : String) {
        if new_currency == "USD" {
            amount = convert_to_usd();
            currency = "USD";
        } else if new_currency == "GBP" {
            amount = convert_to_gbp();
            currency = "GBP";
        } else if new_currency == "EUR" {
            amount = convert_to_eur();
            currency = "EUR";
        } else if new_currency == "CAN" {
            amount = convert_to_can();
            currency = "CAN";
        }
    }
    
    func convert_to_usd() -> Double {
        if self.currency == "GBP" {
            return self.amount * 0.5;
        } else if self.currency == "EUR" {
            return self.amount * 0.67;
        } else if self.currency == "CAN" {
            return self.amount * 0.8;
        }
        return -1.0;
    }
    
    func convert_to_gbp() -> Double {
        if self.currency == "USD" {
            return self.amount * 2.0;
        } else if self.currency == "EUR" {
            return self.amount * 1.33;
        } else if self.currency == "CAN" {
            return self.amount * 1.6;
        }
        return -1.0;
    }
    
    func convert_to_eur() -> Double {
        if self.currency == "GBP" {
            return self.amount * 1.33;
        } else if self.currency == "USD" {
            return self.amount * 1.5;
        } else if self.currency == "CAN" {
            return self.amount * 1.875;
        }
        return -1.0;
    }
    
    func convert_to_can() -> Double {
        if self.currency == "GBP" {
            return self.amount * 0.625;
        } else if self.currency == "EUR" {
            return self.amount * 0.75;
        } else if self.currency == "USD" {
            return self.amount * 1.25;
        }
        return -1.0;
    }
    
    func add(second : Money) -> Money {
        if self.currency == second.currency {
            return Money(amount: self.amount + second.amount, currency: self.currency);
        } else if self.currency == "USD" {
            let second_amount = second.convert_to_usd();
            return Money(amount: self.amount + second_amount, currency: "USD");
        } else if self.currency == "GBP" {
            let second_amount = second.convert_to_gbp();
            return Money(amount: self.amount + second_amount, currency: "GBP");
        } else if self.currency == "EUR" {
            let second_amount = second.convert_to_eur();
            return Money(amount: self.amount + second_amount, currency: "EUR");
        } else if self.currency == "CAN" {
            let second_amount = second.convert_to_can();
            return Money(amount: self.amount + second_amount, currency: "CAN");
        } else {
            return Money(amount: 0.0, currency: self.currency);
        }
    }
    
    func subtract(second : Money) -> Money {
        if self.currency == second.currency {
            return Money(amount: self.amount - second.amount, currency: self.currency);
        } else if self.currency == "USD" {
            let second_amount = second.convert_to_usd();
            return Money(amount: self.amount - second_amount, currency: "USD");
        } else if self.currency == "GBP" {
            let second_amount = second.convert_to_gbp();
            return Money(amount: self.amount - second_amount, currency: "GBP");
        } else if self.currency == "EUR" {
            let second_amount = second.convert_to_eur();
            return Money(amount: self.amount - second_amount, currency: "EUR");
        } else if self.currency == "CAN" {
            let second_amount = second.convert_to_can();
            return Money(amount: self.amount - second_amount, currency: "CAN");
        } else {
            return Money(amount: 0.0, currency: self.currency);
        }
    }
}

/*
TESTING CODE HERE
*/


print("***Testing money struct here***");
print("Creating a money struct: 1.25 USD");
var money_one = Money(amount: 1.25, currency: "USD");
var money_two = Money(amount: 3.25, currency: "CAN");
money_one.convert("GBP");
print("Converting to GBP: \(money_one)");
money_one.convert("CAN");
print("Converting to CAN: \(money_one)");
money_one.convert("EUR");
print("Converting to EUR: \(money_one)");
print("Adding money one to money 2: \(money_one.add(money_two))");
print("Subtracting money one from money 2: \(money_one.subtract(money_two))");
print("");

print("***Testing money (part 2) here***");
print("The description of the first money object: \(money_one)");
print("The description of the second money object: \(money_two)");


class Job {
    var title: String;
    var salary: Double;
    
    init(title: String, salary: Double) {
        self.title = title;
        self.salary = salary;
    }
    
    func calculateIncome(hours : Int) -> Double {
        if salary > 10000 {
            return salary;
        } else {
            return salary * Double(hours);
        }
    }
    
    func raise(percentage : Double) {
        salary += salary * percentage;
    }
    
    func toString() -> String {
        return self.title;
    }
}

/*
TESTING CODE HERE
*/

print("***Testing Job class**");
print("Creating a job, Student, 0/hour");
var student = Job(title: "Student", salary: 0);
print("Creating a job, Developer, 130,000/year");
var developer = Job(title: "Developer", salary: 130000);
print("Creating a job, Intern, 30/hour");
var intern = Job(title: "Intern", salary: 30);
print("Calculating income of \(student.toString()): \(student.calculateIncome(10000))")
print("Calculating income of \(developer.toString()): \(developer.calculateIncome(2080))")
print("Calculating income of \(intern.toString()): \(intern.calculateIncome(1040))")
intern.raise(0.1);
print("Giving intern a raise of 10%: \(intern.salary)");
print("");

class Person {
    var firstname : String;
    var lastname : String;
    var age : Int;
    var job : Job?;
    var spouse : Person?;
    
    init(firstname: String, lastname: String, age: Int) {
        self.firstname = firstname;
        self.lastname = lastname;
        self.age = age;
    }
    
    init(firstname: String, lastname: String, age: Int, job: Job) {
        self.firstname = firstname;
        self.lastname = lastname;
        self.age = age;
        if age < 16 {
            self.job = nil;
        } else {
            self.job = job;
        }
    }
    
    init(firstname: String, lastname: String, age: Int, job: Job, spouse: Person) {
        self.firstname = firstname;
        self.lastname = lastname;
        self.age = age;
        if age < 16 {
            self.job = nil;
        } else {
            self.job = job;
        }
        if age < 18 {
            self.spouse = nil;
        } else {
            self.spouse = spouse;
        }
    }
    
    func toString() -> String {
        var string = "First Name: " + self.firstname;
        string += "\nLast Name: " + self.lastname;
        string += "\nAge: " + String(age);
        if (age > 16 && job != nil) {
            string += "\nJob: " + job!.toString();
        }
        if (age > 18 && spouse != nil) {
            string += "\nSpouse: " + spouse!.firstname;
        }
        return string;
    }
}

/*
TESTING CODE HERE
*/

print("***Testing Person class***");
print("Creating a sister.");
var sister = Person(firstname: "Ali", lastname: "Haugh", age: 17, job: student);
print(sister.toString());
print("Creating a brother.");
var brother = Person(firstname: "Reed", lastname: "Haugh", age: 20, job: intern);
print(brother.toString());
print("Creating a mom.");
var mom = Person(firstname: "Mary", lastname: "Regan", age: 50, job: developer);
print(mom.toString());
print("Creating a dad.");
var dad = Person(firstname: "Nope", lastname: "Nopy", age: 60, job: developer, spouse: mom);
print(dad.toString());
print("");

class Family {
    var members = [Person]();
    
    init(members : [Person]) {
        for person in members {
            self.members.append(person);
        }
    }
    
    func householdIncome() -> Double {
        var total = 0.0;
        for member in members {
            if member.job != nil {
                total += member.job!.salary;
            }
        }
        return total;
    }
    
    func haveChild(firstname: String, lastname: String) {
        members.append(Person(firstname: firstname, lastname: lastname, age: 0));
    }
    
    func isLegalFamily() -> Bool {
        for member in members {
            if member.age > 21 {
                return true;
            }
        }
        return false;
    }
}

/*
TESTING CODE HERE
*/

print("***Testing Family class**");
print("Creating a family with brother and sister.");
var illegal_family = Family(members: [sister, brother]);
print("That's an legal family: \(illegal_family.isLegalFamily())");
print("Creating a family with all members...");
var family = Family(members: [mom, dad, brother, sister]);
print("That's a legal family: \(family.isLegalFamily())");
print("Adding memeber to family...");
family.haveChild("Little", lastname: "Baby");
print("Family's income: \(family.householdIncome())");







