//
//  BindingsAndBindables.swift
//  Bookworm
//
//  Created by Jennifer Lee on 7/16/24.
//

import SwiftUI

struct BindingsAndBindables: View {
    @State private var rememberMe = false

    var body: some View {
        Toggle("Remember Me", isOn: $rememberMe)
    }
    
    
}

#Preview {
    BindingsAndBindables()
}
