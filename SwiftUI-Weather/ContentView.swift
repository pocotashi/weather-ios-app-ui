//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Chosum Tashi on 12/22/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack {
            backgroundView(isNight: $isNight)
            VStack {
                cityView(cityName: "Cuptertino, CA")
                

                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" :  "cloud.sun.fill", temperature: 76)
                
                
                HStack (spacing: 23) {
                    WeatherDayView(daysOfWeek: "Tue",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    
                    WeatherDayView(daysOfWeek: "Wed",
                                   imageName: "wind",
                                   temperature: 74)
                    
                    WeatherDayView(daysOfWeek: "Thur",
                                   imageName: "sun.max.fill",
                                   temperature: 74)
                    
                    WeatherDayView(daysOfWeek: "Fri",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    
                    WeatherDayView(daysOfWeek: "Sat",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    
                   
                }

                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change day time", textColor: .blue , backgroundColor: .white)
                }
                
                Spacer()
                
                    
            }
                    }
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

struct WeatherDayView: View {
    
    var daysOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(daysOfWeek)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

struct backgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                           isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct cityView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack (spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium ))
                .foregroundColor(.white)
            
        }
        .padding(.bottom, 40)
    }
}



