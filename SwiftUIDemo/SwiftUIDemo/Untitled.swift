//
//  Untitled.swift
//  SwiftUIDemo
//
//  Created by Ritesh Dhodakia on 9/1/25.
//

import SwiftUI

class CounterViewModelTest: ObservableObject {
    @Published var count = 0

    func increment() {
        count += 1
        callPaymentMethods()
    }
    
    func callPaymentMethods() {
        let checkout = Checkout1()

        let creditCard = CreditCardPayment1()
        let paypal = PayPalPayment1()

        checkout.processPayment(using: creditCard, amount: 100.0)
        checkout.processPayment(using: paypal, amount: 50.0)
        //test
    }
}

struct ChildCounterView: View {
    @ObservedObject var viewModel: CounterViewModelTest

    var body: some View {
        VStack(spacing: 12) {
            Text("Child View Count: \(viewModel.count)")
                .foregroundColor(.blue)

            Button("Child Increment") {
                viewModel.increment()
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

struct ParentCounterView: View {
    @StateObject private var viewModel = CounterViewModelTest()

    var body: some View {
        VStack(spacing: 20) {
            Text("Parent View Count: \(viewModel.count)")
                .font(.title)

            Button("Parent Increment") {
                viewModel.increment()
            }

            // Pass the view model down
            ChildCounterView(viewModel: viewModel)
        }
        .padding()
    }
}

struct ContentViewTest: View {
    var body: some View {
        ParentCounterView()
    }
}


// Abstraction

protocol PaymentMethod1 {
    func pay(amount: Double)
}

class CreditCardPayment1: PaymentMethod1 {
    func pay(amount: Double) {
        print("Paid \(amount) using Credit Card.")
    }
}

class PayPalPayment1: PaymentMethod1 {
    func pay(amount: Double) {
        print("Paid \(amount) using PayPal.")
    }
}

class Checkout1 {
    func processPayment(using method: PaymentMethod1, amount: Double) {
        method.pay(amount: amount)
    }
}
