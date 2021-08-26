// ContactDetailView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct ContactDetailView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var isShowingImagePickerSheet: Bool = false
   @State private var uiImage: UIImage?
   @ObservedObject var contactViewModel: ContactViewModel
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return ZStack {
         Rectangle()
            .foregroundColor(.gray)
         if let _image = contactViewModel.image {
            _image
               .resizable()
               .scaledToFit()
         } else {
            Text("Add Picture")
               .font(.callout)
         }
      }
      .navigationBarTitle(Text(contactViewModel.name),
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
      
      if let jpegData = _uiImage.jpegData(compressionQuality: 0.8) {
         try? jpegData.write(to: paths[0],
                             options: [.atomicWrite, .completeFileProtection])
      }
      
      contactViewModel.image = Image(uiImage: _uiImage)
      print("Printing \(contactViewModel)")
   }
}



// MARK: - PREVIEWS -

struct ContactDetailView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContactDetailView(contactViewModel: ContactViewModel())
   }
}
