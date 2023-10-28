
import Foundation

//class PostData: ObservableObject{
//    func search(name: String) async {
//        do {
//         //   let movies = try await Webservice().getMovies(searchTerm: name)
//         //   self.movies = movies.map(MovieViewModel.init)
//            
//        } catch {
//            print(error)
//        }
//    }
//}
struct MovieResults: Decodable{
    let results: [Post] // array of post object
}

struct Post: Decodable, Identifiable{ // Decodable protocol
//    var id: String{
//        return objectID
//    }
    var id: Int
   // let points: Int
    let title: String
   // let url : String?
    let release_date: String
    let poster_path: String
    let backdrop_path: String
    let overview: String
}




// Now i am going to start movie api fetch

