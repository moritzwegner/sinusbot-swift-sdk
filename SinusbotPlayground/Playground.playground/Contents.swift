import UIKit
import SinusbotSDK

let sinusbot = SinusbotSDK(host: "HOST", username: "USERNAME", password: "PASSWORD")

sinusbot.login {
    (loggedIn, error) in if (loggedIn) {
        sinusbot.getBotInstances {
            (botInstances, error2) in debugPrint(botInstances![0].name)
        }
    } else if (error != nil) {
        print(error!)
    }
}
