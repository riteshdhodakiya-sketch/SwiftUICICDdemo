//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Ritesh Dhodakia on 8/26/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = CounterViewModel()

        var body: some View {
            VStack(spacing: 20) {
                Text("Count: \(viewModel.count)")
                    .font(.largeTitle)
                
                HStack {
                    Button("➖") {
                        viewModel.decrement()
                        
                    }
                    .font(.largeTitle)

                    Button("➕") {
                        viewModel.increment()
                    }
                    .font(.largeTitle)
                }
            }
            .padding()
        }
}

struct DebugView: View {
    var body: some View {
        Text("🧪 Debug")
            .onAppear { print("✅ DebugView appeared") }
    }
}

class CounterViewModel: ObservableObject {
    @Published var count: Int = 0

    func increment() {
        count += 1
    }

    func decrement() {
        count -= 1
    }
}

#Preview {
    ContentView()
}


// S.O.L.I.D. Explained

/* S – Single Responsibility Principle (SRP)

A class should have only one reason to change.

✅ Each class should do one thing only, and do it well.

Avoid mixing responsibilities (e.g., UI logic and data saving in the same class). */

class UserValidator {
    func validateUserInput() { }
}

class UserRepository {
    func saveUserToDB() { }
}


/* O – Open/Closed Principle (OCP)

Software entities should be open for extension but closed for modification.

✅ You should be able to add new features without changing existing code.

Use protocols and extensions to extend behavior. */

protocol PaymentMethod {
    func processPayment()
}

class CreditCard: PaymentMethod {
    func processPayment() {
        print("Processing credit card payment")
    }
}

class PayPal: PaymentMethod {
    func processPayment() {
        print("Processing PayPal payment")
    }
}


// L – Liskov Substitution Principle (LSP)

/* Objects of a subclass should be replaceable for objects of the superclass without breaking the app.

✅ A subclass should behave like its parent.

Don’t override methods in a way that breaks expected behavior. */

protocol Bird { }

protocol FlyingBird: Bird {
    func fly()
}

class Sparrow: FlyingBird {
    func fly() { print("Flying") }
}

class Penguin: Bird { }



// Interface segrgation principle

// Dependency Inversion Principle (DIP)

// Clients should not be forced to depend on interfaces they don't use.

//✅ Break large protocols into smaller, more focused ones.

protocol Coder {
    func code()
}

protocol Designer {
    func design()
}

class Developer: Coder {
    func code() { }
}

//High-level modules should not depend on low-level modules.
//Both should depend on abstractions (e.g., protocols).

//✅ Use protocols to decouple components.

protocol UserServiceProtocol {
    func fetchUser()
}

class NetworkService: UserServiceProtocol {
    func fetchUser() { }
}

class UserManager {
    var service: UserServiceProtocol

    init(service: UserServiceProtocol) {
        self.service = service
    }
}

class CounterViewModelNew : ObservableObject {
    @Published var count = 0

    func increment() {
        count += 1
    }
}

struct CounterView: View {
    @ObservedObject private var viewModel = CounterViewModelNew()

    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(viewModel.count)")
                .font(.largeTitle)

            Button("Increment") {
                viewModel.increment()
            }
        }
        .padding()
    }
}

protocol AlertStyle {
    func show(message: String)
}

class BasicAlert: AlertStyle {
    func show(message: String) {
        print("⚠️ \(message)")
    }
}

class FancyAlert: AlertStyle {
    func show(message: String) {
        print("🎉 \(message)")
    }
}

struct EnvironmentVar: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.locale) var locale

    var body: some View {
        Text("Current mode: \(colorScheme == .dark ? "Dark" : "Light")")
    }
}

class AppSettings: ObservableObject {
    @Published var isDarkMode = false
}

