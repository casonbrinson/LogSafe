//
//  VisitorLoginForm.swift
//  LogSafe
//
//  Created by Jacob Kohn on 11/29/20.
//  Copyright © 2020 Jacob Kohn, Matthew Krivansky, Cason Brinson. All rights reserved.
//

import SwiftUI

fileprivate enum ActivateAlert {
    case emptyFields, signInComplete
}

struct VisitorLoginForm: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var activateAlert: ActivateAlert = .emptyFields
    @State private var showAlert = false
    
    @State private var nameTextFieldValue = ""
    @State private var whoVisitingTextFieldValue = ""
    @State private var photoImageData: Data? = nil
    @State private var showImagePicker = false
    
    @State private var idOptions = ["Birth Certificate", "State ID", "Passport", "Other"]
    @State private var idOptionPicked = 1
    
    var body: some View {
        
        Form {
            
            Section(header: Text("Name")) {
                TextField("Enter Name Here", text: $nameTextFieldValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Section(header: Text("Visiting")) {
                TextField("Please Enter Who You Are Visiting With", text: $whoVisitingTextFieldValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Section(header: Text("Select ID Type")) {
                Picker("", selection: $idOptionPicked) {
                    ForEach(0 ..< idOptions.count, id: \.self) {
                        Text(self.idOptions[$0])
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            
            if (showImagePicker == false) {
                 Section(header: Text("Take ID Photo")) {
                     Button(action: {
                         self.showImagePicker = true
                     }) {
                         HStack {
                             Image(systemName: "camera.viewfinder")
                                 .imageScale(.large)
                                 .font(Font.title.weight(.regular))
                                 .foregroundColor(.blue)
                             Text("Open Camera")
                         }
                     }
                 }
                 .padding()
             }
             
             if photoImageData != nil {
                 Section(header: Text("Photo Taken Using the Camera")) {
                     getImageFromBinaryData(binaryData: self.photoImageData, defaultFilename: "ImageUnavailable")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(minWidth: 300, maxWidth: 500, alignment: .center)
                 }
                 .padding()
                 
                 Section(header: Text("Cancel and Retake Photo")) {
                     
                     HStack {
                         
                         HStack {
                             Image(systemName: "xmark.circle")
                                 .imageScale(.large)
                                 .font(Font.title.weight(.regular))
                                 .foregroundColor(.blue)
                             Text("Cancel")
                         }
                         .onTapGesture {
                             self.savePickedPhoto(save: false)
                         }
                         .padding()
                     }
                     
                 }
             }//if
            
            Button(action: {
                if self.inputDataValidated() {
                    activateAlert = .signInComplete
                }  else {
                    activateAlert = .emptyFields
                }
                showAlert = true
            }) {
                Text("Continue")
                    .foregroundColor(.blue)
            }
            
        }//form
        .alert(isPresented: $showAlert , content: {
            switch activateAlert {
                case .emptyFields: return emptyFieldAlert
                case .signInComplete: return signInCompleteAlert
            }
        })
        .sheet(isPresented: self.$showImagePicker) {
            PhotoCaptureView(showImagePicker: self.$showImagePicker,
                             photoImageData: self.$photoImageData,
                             cameraOrLibrary: "Camera")
        }
        .navigationBarTitle(Text("Login Form"), displayMode: .inline)
    }//body
    
    var emptyFieldAlert: Alert {
        Alert(title: Text("Missing Information"),
              message: Text("Please make sure you fill out your name, organization, who you're meeting with and take a photo!"),
              dismissButton: .default(Text("OK"))
        )
    }
    
    func inputDataValidated() -> Bool {
        if (nameTextFieldValue == "" || whoVisitingTextFieldValue == "" || photoImageData == nil) {
            return false
        }
        return true
    }
    
    var signInCompleteAlert: Alert {
        Alert(title: Text("Sign In Complete"),
              message: Text("Thank you for signing in!"),
              dismissButton: .default(Text("OK")) {
                self.presentationMode.wrappedValue.dismiss()
              }
        )
    }
    
    func savePickedPhoto(save: Bool) {
        if save == false {
            self.photoImageData = nil
            self.showImagePicker = false
        }
    }
}
