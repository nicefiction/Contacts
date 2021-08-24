// AddContactView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct AddContactView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @Environment(\.presentationMode) var presentationMode
   @State private var name: String = ""
   var contactViewModel: ContactViewModel
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return NavigationView {
         Form {
            TextField("Name", text: $name)
               .textFieldStyle(RoundedBorderTextFieldStyle())
               .padding()
         }
         .navigationBarItems(
            trailing:
               Button("Done",
                      action: {
                        var newContact = ContactModel()
                        newContact.name = name
                        contactViewModel.contacts.append(newContact)
                        presentationMode.wrappedValue.dismiss()
                   }))
      }
   }
}

   
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





// MARK: - PREVIEWS -

struct AddContactView_Previews: PreviewProvider {

   static var previews: some View {

      AddContactView(contactViewModel: ContactViewModel())
   }
}
