import FirebaseMessaging
import UserNotifications

class MessagingService: NSObject, MessagingDelegate, UNUserNotificationCenterDelegate {
    static let shared = MessagingService()
    
    override init() {
        super.init()
        Messaging.messaging().delegate = self
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in }
        UIApplication.shared.registerForRemoteNotifications()
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        guard let uid = Auth.auth().currentUser?.uid, let token = fcmToken else { return }
        Firestore.firestore().collection("users").document(uid).updateData(["fcmToken": token])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
}
