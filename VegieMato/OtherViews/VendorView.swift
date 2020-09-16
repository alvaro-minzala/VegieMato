//
//  VendorView.swift
//  VegieMato
//
//  Created by Rehatbir Singh on 25/01/2020.
//  Copyright © 2020 MysteryCoder456. All rights reserved.
//

import SwiftUI
import Firebase

struct VendorView: View {
    var vendor: Vendor
    @State var showAddPorductView = false
    
    var body: some View {
        VStack() {
            if self.showAddPorductView && Auth.auth().currentUser?.uid == vendor.ownerID {
                AddProductView(vendor: vendor)
            } else {
                ScrollView(.vertical) {
                    VStack(alignment: .center) {
                        ImageView(imageName: vendor.imageName, width: 100, height: 100)
                            .padding(.top, -10.0)
                        
                        Text(vendor.name)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .padding(.vertical, 5.0)
                            .multilineTextAlignment(.center)
                            .fixedSize()
                        
                        Text(vendor.tagline)
                            .font(.headline)
                    }
                    
                    Divider()
                    
                    ForEach(vendor.products) { product in
                        VStack {
                            ProductRow(product: product)
                                .padding(.all)
                        }
                        
                        Divider()
                    }
                    
                    if Auth.auth().currentUser?.uid == vendor.ownerID {
                        Button(action: {self.showAddPorductView = true}) {
                            Text("Add Product")
                        }
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct VendorView_Previews: PreviewProvider {
    static var previews: some View {
        VendorView(vendor: defaultVendor)
    }
}
