//
//  ContentView.swift
//  weather-app
//
//  Created by Rahul Srikar Kadiyala on 24/1/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue,
                           middleColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray : .white)
            
            VStack {
                CityTextView(CityName: "Brisbane, QLD")
                
                MainWeatherStatus(imagename: isNight ? "moon.stars.fill" : "sun.max.fill",
                                  temperature: isNight ? 24 : 30)
                
                HStack {
                    WeatherDayView(dayofweek: "Tue  ",
                                   imagename: "cloud.sun.fill",
                                   temperature: 28)
                    
                    WeatherDayView(dayofweek: "Wed  ",
                                   imagename: "cloud.fill",
                                   temperature: 25)
                    
                    WeatherDayView(dayofweek: "Thu  ",
                                   imagename: "sun.max.fill",
                                   temperature: 32)
                    
                    WeatherDayView(dayofweek: "Fri  ",
                                   imagename: "cloud.sun.fill",
                                   temperature: 27)
                    
                    WeatherDayView(dayofweek: "Sat  ",
                                   imagename: "sun.and.horizon.fill",
                                   temperature: 26)
                    
                    WeatherDayView(dayofweek: "Sun  ",
                                   imagename: "wind",
                                   temperature: 24)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: isNight ? .black : .blue,
                                  backgroundColor: .white)
                }
                
              Spacer()
                
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
    var dayofweek: String
    var imagename: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(dayofweek)
                .font(.system(size: 25, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imagename)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 25)
            Text("\(temperature)°")
                .font(.system(size: 25, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var middleColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, middleColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var CityName: String
    var body: some View {
        Text(CityName)
            .font(.system(size: 35, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(50)
    }
}

struct MainWeatherStatus: View {
    var imagename: String
    var temperature: Int
    var body: some View {
        VStack {
            Image(systemName: imagename)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding(30)
        }
    }
}

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(15)
    }
}

