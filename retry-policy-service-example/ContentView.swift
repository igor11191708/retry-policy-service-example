//
//  ContentView.swift
//  retry-policy-service-example
//
//  Created by Igor on 07.03.2023.
//


import SwiftUI
import retry_policy_service


final class ViewModel : ObservableObject{
    
    func constant() async {
        let retry = RetryService(strategy: .constant())
        for (step, delay) in retry.enumerated(){
            try? await Task.sleep(nanoseconds: delay)
            print("past delay \(delay) on step \(step)")
        }
    }
    
    func exponential() async {
        let retry = RetryService(strategy: .exponential(retry: 5, multiplier: 2, duration: .seconds(1), timeout: .seconds(5)))
        for (step, delay) in retry.enumerated(){
            try? await Task.sleep(nanoseconds: delay)
            print("past delay \(delay) on step \(step)")
        }
        print("finished")
    }
}

struct ContentView: View {
    
    @StateObject var model = ViewModel()
    
    var body: some View {
        VStack {
            Button("constatnt") { Task { await model.constant() } }
            Button("exponential") { Task { await model.exponential() } }
        }
        .padding()
        .task {
            await model.exponential()
        }
        
    }
}
