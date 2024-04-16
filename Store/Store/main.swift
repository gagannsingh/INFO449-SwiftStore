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
  var pricePerItem: Int // lowercase for camelCase

  init(name: String, pricePerItem: Int) {
    self.name = name
    self.pricePerItem = pricePerItem
  }

  func price() -> Int {
    return pricePerItem
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
    var totalPrice = 0
    for item in scanned {
      totalPrice += item.price()
    }
    return totalPrice
  }

  func output() -> String {
    var receiptText = "Receipt:\n"
    for item in scanned {
      receiptText += "\(item.name): $\(String(format: "%.2f", Double(item.price()) / 100))\n"
    }
    receiptText += "------------------\n"
    receiptText += "TOTAL: $\(String(format: "%.2f", Double(subtotal()) / 100))"
    return receiptText
  }
}

class Register {
  var receipt: Receipt

  init() {
    receipt = Receipt()
  }

  func scan(item: SKU) { // renamed for clarity
    receipt.add(item)
  }

  func subtotal() -> Int {
    return receipt.items().reduce(0) { $0 + $1.price() }
  }
}

class Store {
  let version = "0.1"
  func helloWorld() -> String {
    return "Hello world"
  }
}
