import Foundation
import LocalAuthentication
import SwiftUI

class NetworkManager: ObservableObject{
   @Published var posts = [Post]()
    let apilink: LocalizedStringKey = "apilink"
    let api = String(localized: "apilink")
    // let api: String = apilink
   // let api: String = "https://api.themoviedb.org/3/movie/popular?api_key=2ba3e30a241df411933c3d27f92af32b"

    func fetchData(){

        if let url = URL(string: api){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with:  url) { (data, response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                           let movieResults = try decoder.decode(MovieResults.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = movieResults.results
                            }

                        }
                        catch{
                             print(error )
                        }

                    }
                    
                }
            }
            task.resume()
        }
    }
    
}



// Now i am going to start movie api fetch
