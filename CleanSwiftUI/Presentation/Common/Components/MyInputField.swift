//
//  MyInputField.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import SwiftUI

struct MyInputField: View {
    var title: String
    var footer: String?
    @State var inputText: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
            TextField(title, text: $inputText)
                .padding()
                .border(.black)
        }
        .padding()
    }
}

#Preview {
    MyInputField(title: "My Input")
}
