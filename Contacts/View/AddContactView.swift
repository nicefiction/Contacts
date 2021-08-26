// AddContactView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct AddContactView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @Environment(\.presentationMode) var presentationMode
   @State private var name: String = ""
   @ObservedObject var contactsViewModel: ContactsViewModel
   
   
   
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
                        let newContact = ContactViewModel()
                        newContact.name = name
                        contactsViewModel.list.append(newContact)
                        presentationMode.wrappedValue.dismiss()
                   }))
      }
   }
}





// MARK: - PREVIEWS -

struct AddContactView_Previews: PreviewProvider {

   static var previews: some View {

      AddContactView(contactsViewModel: ContactsViewModel())
   }
}
