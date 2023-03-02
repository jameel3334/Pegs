//
//  AppointmentView.swift
//  Pegs
//
//  Created by Mohammed Jameeluddin on 3/2/23.
//

import SwiftUI

struct AppointmentView: View {
    @ObservedObject var appointmentData = AppointmentData()
    @State private var showAddAppointment = false
    @State private var appointmentDate = Date()
    @State private var appointmentLocation = ""
    @State private var appointmentDuration = 0
    
    var body: some View {
        TabView {
            NavigationView {
                List {
                    ForEach(appointmentData.appointments) { appointment in
                        VStack(alignment: .leading) {
                            Text(appointment.location)
                                .font(.headline)
                            Text(dateFormatter.string(from: appointment.date))
                                .font(.subheadline)
                            Text("\(appointment.duration) minutes")
                                .font(.subheadline)
                        }
                    }
                }
                .navigationTitle("Fishing Appointments")
                .navigationBarItems(trailing:
                    Button(action: {
                        self.showAddAppointment = true
                    }) {
                        Image(systemName: "plus")
                    }
                )
                .sheet(isPresented: $showAddAppointment) {
                    VStack {
                        DatePicker(
                            "Date",
                            selection: $appointmentDate,
                            in: Date()...,
                            displayedComponents: [.date, .hourAndMinute]
                        )
                        .padding()
                        TextField("Location", text: $appointmentLocation)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Stepper("Duration: \(appointmentDuration) minutes", value: $appointmentDuration, in: 30...120, step: 30)
                            .padding()
                        Button("Save") {
                            self.appointmentData.addAppointment(date: appointmentDate, location: appointmentLocation, duration: appointmentDuration)
                            self.showAddAppointment = false
                        }
                        .padding()
                    }
                }
            }
            .tabItem {
                Image(systemName: "calendar")
                Text("Appointments")
            }
            
            LoginView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Login")
                }
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
}

struct AppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentView()
    }
}
