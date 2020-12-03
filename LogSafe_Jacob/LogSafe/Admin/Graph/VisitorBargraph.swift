//
//  VisitorBargraph.swift
//  LogSafe
//
//  Created by Jacob Kohn on 12/2/20.
//  Copyright © 2020 Jacob Kohn, Matthew Krivansky, Cason Brinson. All rights reserved.
//

import SwiftUI

struct BarGraph: View {
    
    @State var pickerSelection = 0
    @State var barValues : [[CGFloat]] =
        [
        [5,150,50,100,200,110,30,170,50],
        [200,110,30,170,50, 100,100,100,200],
        [10,20,50,100,120,90,180,200,40]
        ]
    
    var body: some View {
        ZStack{
            Color(.black).edgesIgnoringSafeArea(.all)

            VStack{
                Text("Bar Charts").foregroundColor(.white)
                    .font(.largeTitle)

                Picker(selection: $pickerSelection, label: Text("Stats"))
                    {
                    Text("Tody").tag(0)
                    Text("This Week").tag(1)
                    Text("This Month").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 10)

                HStack(alignment: .center, spacing: 10)
                {
                    ForEach(barValues[pickerSelection], id: \.self){
                        data in
                        
                        BarView(value: data, cornerRadius: CGFloat(integerLiteral: 10*self.pickerSelection))
                    }
                }.padding(.top, 24).animation(.default)
            }
        }
    }
    
    init() {
            UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        }
    
    
}
