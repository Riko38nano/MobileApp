//
//  TestClose.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 31/03/2021.
//

import SwiftUI

struct TestClose: View {
    var body: some View {
        ShowLicenseAgreement()
    }
}

struct TestClose_Previews: PreviewProvider {
    static var previews: some View {
        TestClose()
    }
}
struct ShowLicenseAgreement: View {
    @State private var isShowingSheet = false
    var body: some View {
        Button(action: {
            isShowingSheet.toggle()
        }) {
            Text("Show License Agreement")
        }
        .sheet(isPresented: $isShowingSheet,
               onDismiss: didDismiss) {
            VStack {
                Text("License Agreement")
                    .font(.title)
                    .padding(50)
                Text("""
                        Terms and conditions go here.
                    """)
                    .padding(50)
                Button("Dismiss",
                       action: { isShowingSheet.toggle() })
            }
        }
    }

    func didDismiss() {
        // Handle the dismissing action.
    }
}