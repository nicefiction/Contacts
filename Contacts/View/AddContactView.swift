// AddContactView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct AddContactView: View {
   
   // MARK: PROPERTY WRAPPERS
   
   @Environment(\.presentationMode) var presentationMode
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      Button("Dismiss") {
         presentationMode.wrappedValue.dismiss()
      }
   }
}





// MARK: - PREVIEWS -

struct AddContactView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      AddContactView()
   }
}
