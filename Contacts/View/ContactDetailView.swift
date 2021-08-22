// ContactDetailView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct ContactDetailView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @Environment(\.presentationMode) var presentationMode
   @State private var isShowingImagePickerSheet: Bool = false
   @State private var uiImage: UIImage?
   @State private var image: Image?
   
   
   
   // MARK: - PROPERTIES
   
   let contact: String
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      //      return Image("greta")
      //         .resizable()
      //         .scaledToFit()
      //         .navigationBarTitle(Text(contact),
      //                             displayMode: .inline)
      
      
      ZStack {
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
      .navigationBarItems(trailing: Button("Save", action: {
         guard let _uiImage = self.uiImage
         else { return }
         
         let imageSaver = ImageSaver()
         imageSaver.succesHandler = { print("Succes!") }
         imageSaver.errorHandler = { (error: Error) in
            print("Oops: \(error.localizedDescription)")
         }
         
         imageSaver.writeToPhotoAlbum(image: _uiImage)
         
         presentationMode.wrappedValue.dismiss()
      }))
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
      
      ContactDetailView(contact: "Olivia")
   }
}
