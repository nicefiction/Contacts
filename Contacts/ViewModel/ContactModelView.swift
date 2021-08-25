// ContactViewModel.swift

// MARK: LIBRARIES

import SwiftUI


class ContactViewModel: ObservableObject {
   
   @Published private var contact: ContactModel = ContactModel()
}
