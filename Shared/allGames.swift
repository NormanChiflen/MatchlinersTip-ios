////
////  PostList.swift
////  UnderDog Prototype
////
////  Created by John Lee on 3/21/21.
////
//
//import SwiftUI
//
//struct allGames: View {
//    @State var posts: [Initial.Datas] = []
//    
//    var body: some View {
//        Text("Popular Events")
//            .font(.system(size: 30, weight: .bold, design: .rounded))
//        List(posts) { post in
//            Text(post.title)
//        }
//        .onAppear{
//            OddsApi().getPosts {
//                (posts) in
//                self.posts = posts
//            }
//        }
//    }
//}
//
//struct allGames_Previews: PreviewProvider {
//    static var previews: some View {
//        allGames()
//    }
//}
