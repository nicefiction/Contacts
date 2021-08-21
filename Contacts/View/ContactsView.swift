// ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct ContactsView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var isShowingNewContactSheet: Bool = false
   
   
   
   // MARK: - PROPERTIES
   
   let contactList: Array<String> = [
      "Dorothy Gale", "Ozma of Oz", "Glinda of Oz", "Taylor Swift"
   ]
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      NavigationView {
         List {
            ForEach(contactList,
                    id: \.self) { (contact: String) in
               NavigationLink(destination: ContactDetailView(contact: contact)) {
                  HStack {
                     Image("greta")
                        .resizable()
                        .frame(width: 50,
                               height: 50)
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                     Text(contact)
                  }
               }
            }
         }
         .navigationTitle("My Contacts")
         .navigationBarItems(trailing: Button(action: {
            print("The + button is tapped.")
            isShowingNewContactSheet.toggle()
         }, label: {
            Image(systemName: "plus.circle")
               .font(.title)
         }))
         .sheet(isPresented: $isShowingNewContactSheet) {
            AddContactView()
         }
      }
   }
}






// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContactsView()
   }
}
