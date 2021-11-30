//
//  HistoryView.swift
//  NBack
//
//  Created by Leo Zaki on 2021-11-29.
//

import SwiftUICharts
import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var vm : NBackVM
    
    @State var isAudio:Bool = false
    @State var isVisual:Bool = false
    
    @State private var number = 0
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            VStack{
                BarChartView(
                    data: ChartData(values: [
                        ("Jan",12),
                        ("Feb",1),
                        ("Mar",20),
                        ("May",5),
                        ("Jun",15),
                    ]),
                    title: "Progress")
            }.navigationTitle("History")
        }
        .task{
            // Cancel ongoing game
            vm.playing = false
        }
        
    }
}
