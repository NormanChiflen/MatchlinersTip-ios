//
//  PostList.swift
//  UnderDog Prototype
//
//  Created by John Lee on 3/21/21.
//

import SwiftUI

struct PostList: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear{
                OddsApi().getPosts()
            }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
