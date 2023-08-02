//
//  ContentView.swift
//  Weather Swift
//
//  Created by Erkin Gönültaş on 2.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: isNight ? [.primary, .blue] : [.blue, .cyan, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            VStack(alignment: .center){
                Spacer()
                Text("İSTANBUL")
                    .font(.system(size: 26, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 25) {
                    Image(systemName: isNight ? "moon.fill" : "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180)
                    Text("31°")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.bottom)
                }
                Spacer()
                HStack(spacing: 25) {
                    WeatherDayView(day: "PER", image: "sun.max.fill", temp: 34)
                    WeatherDayView(day: "CUM", image: "sun.max.fill", temp: 34)
                    WeatherDayView(day: "CMT", image: "sun.max.fill", temp: 34)
                    WeatherDayView(day: "PAZ", image: "sun.max.fill", temp: 34)
                }.padding(.bottom)
                Button {
                    isNight.toggle()
                } label: {
                    Text("CHANGE THE DAY TIME")
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                        .background(isNight ? .secondary : Color.blue)
                        .cornerRadius(12)
                        .frame(height: 50)
                        .font(.system(size: 20, weight: .light, design: .rounded))
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

struct WeatherDayView: View {
    
    var day: String
    var image: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text(day)
                .font(.system(size: 21, weight: .medium, design: .rounded))
                .foregroundColor(.white)
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
            Text("\(temp)°")
                .font(.system(size: 21, weight: .bold, design: .rounded))
                .foregroundColor(.cyan)
        }
    }
}
