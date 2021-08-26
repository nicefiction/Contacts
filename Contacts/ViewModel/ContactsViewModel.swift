// ContactsViewModel.swift

// MARK: - LIBRARIES

import SwiftUI


class ContactsViewModel: ObservableObject {
   
   @Published var list = Array<ContactViewModel>()
}
