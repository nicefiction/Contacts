// ContactDetailView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct ContactDetailView: View {
   
   // MARK: - PROPERTIES
   
   let contact: String
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      Text(contact)
         .font(.title)
   }
}





// MARK: - PREVIEWS -

struct ContactDetailView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContactDetailView(contact: "Olivia")
   }
}
