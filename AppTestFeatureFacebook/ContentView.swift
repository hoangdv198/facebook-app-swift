import SwiftUI
import FacebookLogin

struct ContentView: View {
    @State private var loginResult: String = "Not logged in"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button(action: handleFacebookLogin) {
                HStack {
                    Image(systemName: "person.crop.circle.fill.badge.checkmark")
                    Text("Login with Facebook")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            
            Text(loginResult)
                .padding()
                .foregroundColor(.gray)
        }
        .padding()
    }
    
    func handleFacebookLogin() {
        let loginManager = LoginManager()
        
        loginManager.logIn(permissions: ["public_profile", "email"], from: nil) { result, error in
            if let error = error {
                print("Facebook login failed: \(error.localizedDescription)")
                loginResult = "Login failed: \(error.localizedDescription)"
            } else if let result = result, !result.isCancelled {
                print("Facebook login success: \(result.token?.tokenString ?? "")")
                loginResult = "Logged in successfully! Token: \(result.token?.tokenString ?? "")"
            } else {
                print("Facebook login was cancelled")
                loginResult = "Login cancelled"
            }
        }
    }
}

#Preview {
    ContentView()
}
