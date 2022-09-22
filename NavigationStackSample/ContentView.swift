//
//  ContentView.swift
//  NavigationStackSample
//
//  Created by ミズキ on 2022/09/22.
//

import SwiftUI
struct Company: Identifiable, Hashable {
    var id = UUID()
    let name: String
}
struct Stock: Identifiable, Hashable {
    var id = UUID()
    let ticker: String
}

struct ContentView: View {
    var companies: [Company] =
    [
        .init(name: "Apple"),
        .init(name: "Google"),
        .init(name: "Facebook"),
        .init(name: "Amazon")
    ]
    
    @State var path: [Company] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List(companies) { company in
                Section("会社") {
//                    ForEach(companies) { company in
                        NavigationLink(company.name, value: company)
//                    }
                }
            }
            .navigationDestination(for: Company.self) { company in
                VStack {
                    Text(company.name)
                    Button("pop") {
                        path = [companies[1],companies[0],companies[2]]
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
