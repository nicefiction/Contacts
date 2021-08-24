// ContactDetailView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct ContactDetailView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var isShowingImagePickerSheet: Bool = false
   @State private var image: Image?
   @State private var uiImage: UIImage?
   
   
   
   // MARK: - PROPERTIES
   
//   var contact: ContactModel
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return ZStack {
         Rectangle()
            .foregroundColor(.gray)
         if let _image = image {
            _image
               .resizable()
               .scaledToFit()
         } else {
            Text("Add Picture")
               .font(.callout)
         }
      }
      .onTapGesture {
         isShowingImagePickerSheet.toggle()
      }
      .sheet(isPresented: $isShowingImagePickerSheet,
             onDismiss: loadImage) {
         ImagePicker(uiImage: $uiImage)
      }
   }
   
   
   // MARK: - METHODS
   
   func loadImage() {
      
      guard let _uiImage = uiImage
      else { return }
      
      image = Image(uiImage: _uiImage)
   }
   
   

}





// MARK: - PREVIEWS -

struct ContactDetailView_Previews: PreviewProvider {

   static var previews: some View {

      ContactDetailView()
   }
}
