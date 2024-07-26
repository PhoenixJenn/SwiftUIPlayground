//
//  SchedLocalNotifications.swift
//  HotProspects
//
//  Created by Jennifer Lee on 7/26/24.
// https://www.hackingwithswift.com/books/ios-swiftui/scheduling-local-notifications


/*:
 If you run your app now, press the first button to request notification permission, then press the second to add an actual notification.

 Now for the important part: once your notification has been added press Cmd+L in the simulator to lock the screen. After a few seconds have passed the device should wake up with a sound, and show our message – nice
 */
import SwiftUI
import UserNotifications



struct SchedLocalNotifications: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
Divider()
            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default

                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

#Preview {
    SchedLocalNotifications()
}
