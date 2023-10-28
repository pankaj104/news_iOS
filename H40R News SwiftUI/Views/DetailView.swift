// Now i am going to start movie api fetch


import SwiftUI

struct DetailView: View {
    let post: Post
    
    var body: some View {
        
        Image(systemName: "person.fill")
            .data(url: URL(string: "https://image.tmdb.org/t/p/w500\(post.backdrop_path)")!)
            .frame(width: 350.0, height: 300.0)
        Text(post.overview).padding()
            .navigationBarTitle(post.title)

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}


