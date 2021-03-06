// ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct ContactsView: View {
   
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
               NavigationLink(destination: Text(contact)) {
                  HStack {
                     Text(contact)
                     Spacer()
                     Image("greta")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 90)
                  }
               }
            }
         }
         .navigationTitle("My Contacts")
         .navigationBarItems(trailing: Button(action: {
            
         }, label: {
            Image(systemName: "plus.circle")
               .font(.title)
         }))
      }
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContactsView()
   }
}
