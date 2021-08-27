// ContactDetailView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct ContactPersonDetailView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var isShowingImagePickerSheet: Bool = false
   @State private var uiImage: UIImage?
   var contactPerson: ContactPerson
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return ZStack {
         Rectangle()
            .foregroundColor(.gray)
         if let _image = Image(contactPerson.imageName) {
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
      
      let paths = FileManager.default.urls(for: .documentDirectory,
                                           in: .userDomainMask)
      
      if let _jpegData = _uiImage.jpegData(compressionQuality: 0.8) {
         try? _jpegData.write(to: paths[0],
                             options: [.atomicWrite, .completeFileProtection])
      }
      
     
      
      print("Printing \(contactPerson)")
   }
}



// MARK: - PREVIEWS -

struct ContactDetailView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContactPersonDetailView(contactPerson: ContactPerson())
   }
}
