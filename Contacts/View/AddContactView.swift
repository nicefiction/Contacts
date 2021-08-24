//// AddContactView.swift
//
//// MARK: - LIBRARIES -
//
//import SwiftUI
//
//
//
//struct AddContactView: View {
//
//   // MARK: PROPERTY WRAPPERS
//
//   @Environment(\.presentationMode) var presentationMode
//   @ObservedObject var contacts: ContactViewModel
//   @State private var name: String = ""
//
//
//
//
//
//   // MARK: - COMPUTED PROPERTIES
//
//   var body: some View {
//
//      return
//         NavigationView {
//            Form {
//               TextField("name",
//                         text: $name)
//            }
//            .navigationBarItems(trailing: Button("Done") {
//               let newContact = ContactModel(name: name)
//               contacts.contactList.append(newContact)
//               presentationMode.wrappedValue.dismiss()
//            })
//         }
//   }
//}
//
//
//
//
//
//// MARK: - PREVIEWS -
//
//struct AddContactView_Previews: PreviewProvider {
//
//   static var previews: some View {
//
//      AddContactView(contacts: ContactViewModel())
//   }
//}
