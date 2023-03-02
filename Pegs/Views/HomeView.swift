//
//  HomeView.swift
//  Pegs
//
//  Created by Mohammed Jameeluddin on 3/2/23.
//

import SwiftUI
import MapKit

struct HomeView: View {
        @StateObject private var appointmentData = AppointmentData()
        @State private var userLocation = CLLocationCoordinate2D()
        
        init() {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemGreen]
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.systemGreen]
            UINavigationBar.appearance().tintColor = .systemGreen
        }
        
        var body: some View {
            TabView {
                AppointmentView(appointmentData: appointmentData)
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Appointments")
                    }
                    .tag(0)
                
                MapView(userLocation: $userLocation)
                    .tabItem {
                        Image(systemName: "map")
                        Text("Map")
                    }
                    .tag(1)
                
                LoginView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Login")
                    }
                    .tag(2)
            }
            .onAppear {
                LocationManager.shared.getUserLocation { userLocation in
                    self.userLocation = userLocation
                }
            }
        }
    }
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
