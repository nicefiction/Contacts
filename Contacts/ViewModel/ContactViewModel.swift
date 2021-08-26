// ContactViewModel.swift

// MARK: - LIBRARIES -

import SwiftUI



class ContactViewModel: Identifiable,
                        ObservableObject {
   
   let id: UUID = UUID()
   @Published var image: Image = Image("greta")
   @Published var name: String = ""
}
