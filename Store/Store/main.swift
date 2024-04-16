//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
  var name: String { get }
  func price() -> Int
}

class Item: SKU {
  var name: String
  var priceEach: Int

  init(name: String, priceEach: Int) {
    self.name = name
    self.priceEach = priceEach
  }

  func price() -> Int {
    return priceEach
  }
}

class Receipt {
    var scanned: [SKU] = []

    func add(_ item: SKU) {
        scanned.append(item)
    }

    func items() -> [SKU] {
        return scanned
    }

    func subtotal() -> Int {
        return scanned.reduce(0) { $0 + $1.price() }
    }

    func total() -> Int {
        return subtotal() // Simply return the subtotal
    }

    func output() -> String {
        var receiptText = "Receipt:\n"
        for item in scanned {
            receiptText += "\(item.name): $\(String(format: "%.2f", Double(item.price()) / 100))\n"
        }
        receiptText += "------------------\n"
        receiptText += "TOTAL: $\(String(format: "%.2f", Double(total()) / 100))" // Use total() here
        return receiptText
    }
}

class Register {
  var receipt: Receipt

  init() {
    receipt = Receipt()
  }

  func scan(_ item: SKU) {
    receipt.add(item)
  }

  func subtotal() -> Int {
    return receipt.items().reduce(0) { $0 + $1.price() }
  }
  
  func total() -> Int {
    return subtotal() 
  }
}

class Store {
  let version = "0.1"
  func helloWorld() -> String {
    return "Hello world"
  }
}
