//
//  ErrorAlert.swift
//  ReelQuick
//
//  Created by Megan Wiemer on 5/9/25.
//

import SwiftUI

struct ErrorAlert: ViewModifier {
    var showAlert: Binding<Bool>
    let message: String

    func body(content: Content) -> some View {
        content
            .alert(
                message,
                isPresented: showAlert) {
                    Button("OK", role: .cancel) { }
                }
    }
}

extension View {
    func errorAlert(message: Binding<String?>) -> some View {
        let showAlert = Binding<Bool>(
            get: { message.wrappedValue != nil },
                    set: { newValue in
                        if !newValue {
                            message.wrappedValue = nil
                        }
                    }
                )

        return modifier(ErrorAlert(showAlert: showAlert, message: message.wrappedValue ?? ""))
    }
}
