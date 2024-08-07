//
//  LongerText.swift
//  Bookworm
//
//  Created by Jennifer Lee on 7/16/24.
//

/*:
 https://www.hackingwithswift.com/books/ios-swiftui/accepting-multi-line-text-input-with-texteditor
 Tip: SwiftUI often changes the way things look once they are inside a Form, so make sure and try them both inside and outside a Form to see how they vary.
 */

import SwiftUI

struct LongerText: View {
    
    @AppStorage("notes") private var notes = ""

        var body: some View {
            NavigationStack {
                TextEditor(text: $notes)
                                .navigationTitle("Notes")
                                .padding()
                Divider()
                /*:
                 When we create a TextField, we can optionally provide an axis it can grow along. This means the textfield starts out as a regular, single-line text field, but as the user types it can grow, just like the iMessage text box does.
                 */
                TextField("Enter your text", text: $notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .navigationTitle("Notes")
                    .padding()
            }
        }
}

#Preview {
    LongerText()
}
