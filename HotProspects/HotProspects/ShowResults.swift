//
//  ShowResults.swift
//  HotProspects
//
//  Created by Jennifer Lee on 7/26/24.
//

import SwiftUI

struct ShowResults: View {
    
    @State private var output = ""
    
    
    var body: some View {
        
        Text(output)
                    .task {
                        await fetchReadings()
                    }
            }
    
    func fetchReadings() async {
        
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        let result = await fetchTask.result
        do {
            output = try result.get()
        } catch {
            output = "Error: \(error.localizedDescription)"
        }
        
        /*:
         switch result {
             case .success(let str):
                 output = str
             case .failure(let error):
                 output = "Error: \(error.localizedDescription)"
         }
         */
    }
    
    
}

//            func fetchReadings() async {
//                do {
//                    let url = URL(string: "https://hws.dev/readings.json")!
//                    let (data, _) = try await URLSession.shared.data(from: url)
//                    let readings = try JSONDecoder().decode([Double].self, from: data)
//                    output = "Found \(readings.count) readings"
//                } catch {
//                    print("Download error")
//                }
                
  

    


#Preview {
    ShowResults()
}
