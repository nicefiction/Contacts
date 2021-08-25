// ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI


struct ContactsView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @ObservedObject var contactViewModel = ContactViewModel()
   @ObservedObject var contactsViewModel = ContactsViewModel()
   @State private var isShowingAddContactSheet: Bool = false
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return NavigationView {
         List {
            ForEach(contactsViewModel.contacts) { (contactViewModel: ContactViewModel) in
               NavigationLink(destination: ContactDetailView(contactViewModel: contactViewModel)) {
                  Text(contactViewModel.contact.name)
               }
            }
         }
         .navigationBarTitle("Contacts")
         .navigationBarItems(
            trailing: Button(
               action: {
                  isShowingAddContactSheet.toggle()
               },
               label: {
                  Image(systemName: "plus.circle")
                     .font(.title)
               }))
         .sheet(isPresented: $isShowingAddContactSheet,
                content: {
                  AddContactView(contactsViewModel: contactsViewModel)
         })
      }
   }
   
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContactsView()
   }
}
