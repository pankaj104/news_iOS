// Now i am going to start movie api fetch


import SwiftUI

struct ContentView: View {
    let text1:LocalizedStringKey = "text1"
    
    @ObservedObject  var networkManager = NetworkManager()
    @State private var searchText = ""


    //var list[] = networkManager.posts
    
    var body: some View {

        NavigationView{
            var filteredPost = networkManager.posts
            var postapi = filteredPost.filter{$0.title.contains(searchText)}
            
            List(searchText == "" ? filteredPost : postapi ){ post in
                NavigationLink(destination: DetailView(post: post)) {
                    VStack {
                        HStack {
                            Image(systemName: "person.fill")
                                .data(url: URL(string: "https://image.tmdb.org/t/p/w500\(post.backdrop_path)")!)
                                .frame(width: 120.0, height: 100.0)
                            VStack {
                                Text(post.title)
                                Text(String(post.release_date))
                            }
                        }
                            }
                    
                }
                
                }
            
            .navigationBarTitle(text1)
        
            .searchable(text: $searchText)
//            .onChange(of: searchText) {
//                searchValue in
//
//                    if !searchValue.isEmpty{
//
//                        List( filteredPost.filter{$0.title.contains("R")})
//                         { post in
//                                     Text(post.title)
//                         }
//
//                    }
//                    else{
//                        filteredPost
//                    }
//            }
        }
        



        
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
      //  searchText(text: .constant(""))
    }
}

extension Image {

func data(url:URL) -> Self {

if let data = try? Data(contentsOf: url) {

return Image(uiImage: UIImage(data: data)!)
.resizable()

}

return self

.resizable()

}

}



