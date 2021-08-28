// ContactDetailView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct ContactPersonDetailView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var isShowingImagePickerSheet: Bool = false
   @State private var uiImage: UIImage?
   @ObservedObject var contactPerson: ContactPerson
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return ZStack {
         Rectangle()
            .foregroundColor(.gray)
         if let _image = contactPerson.profileImage {
            _image
               .resizable()
               .scaledToFit()
         } else {
            Text("Add Picture")
               .font(.callout)
         }
      }
      .navigationBarTitle(Text(contactPerson.name),
                          displayMode: .inline)
      .onTapGesture { isShowingImagePickerSheet.toggle() }
      .sheet(isPresented: $isShowingImagePickerSheet,
             onDismiss: loadImage) {
         ImagePicker(uiImage: $uiImage)
      }
   }
   
   
   
   // MARK: - METHODS
   
   func loadImage() {
      
      guard let _uiImage = uiImage
      else { return }
      
      contactPerson.profileImage = Image(uiImage: _uiImage)
      print("Printing \(contactPerson)")
   }
}



// MARK: - PREVIEWS -

struct ContactDetailView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContactPersonDetailView(contactPerson: ContactPerson())
   }
}
