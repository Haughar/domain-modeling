//
//  main.swift
//  domain-modeling
//
//  Created by Alison Rose Haugh on 10/14/15.
//  Copyright © 2015 Alison Haugh. All rights reserved.
//

import Foundation

struct Money {
    var amount: Double;
    var currency: String;
    
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
        }
    }
    
    func convert_to_usd() -> Double {
        if self.currency == "GDP" {
            return self.amount * 0.5;
        } else if self.currency == "EUR" {
            return self.amount * 0.67;
        } else if self.currency == "CAN" {
            return self.amount * 0.8;
        }
        return 0.0;
    }
    
    func convert_to_gbp() -> Double {
        if self.currency == "USD" {
            return self.amount * 0.5;
        } else if self.currency == "EUR" {
            return self.amount * 0.75;
        } else if self.currency == "CAN" {
            return self.amount * 0.625;
        }
        return 0.0;
    }
    
    func convert_to_eur() -> Double {
        if self.currency == "GDP" {
            return self.amount * 1.33;
        } else if self.currency == "USD" {
            return self.amount * 1.5;
        } else if self.currency == "CAN" {
            return self.amount * 1.875;
        }
        return 0.0;
    }
    
    func convert_to_can() -> Double {
        if self.currency == "GDP" {
            return self.amount * 0.625;
        } else if self.currency == "EUR" {
            return self.amount * 0.75;
        } else if self.currency == "USD" {
            return self.amount * 1.25;
        }
        return 0.0;
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


class Job {
    var title: String;
    var salary: Double;
    
    init(title: String, salary: Double) {
        self.title = title;
        self.salary = salary;
    }
    
    func calculateIncome(hours : Double) -> Double {
        return salary * hours;
    }
    
    func raise(percentage : Double) {
        salary += salary * percentage;
    }
}





