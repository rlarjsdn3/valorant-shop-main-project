//
//  SkinsView.swift
//  ValorantShop
//
//  Created by 김건우 on 2023/09/23.
//

import SwiftUI

struct SkinListView: View {
    
    // MARK: - WRAPPER PROPERTIES
    
    @EnvironmentObject var viewModel: ViewModel
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("\(viewModel.storeSkinsRemainingTime)")
                    
                    Spacer()
                }
                .fontWeight(.bold)
                .padding(.horizontal)
                
                VStack(spacing: 20) {
                    ForEach(viewModel.storeSkins.skinInfos) { skinInfo in
                        SkinCell(skinInfo)
                            .padding(.horizontal)
                    }
                }
            }
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity)
        .background(Color(uiColor: UIColor.secondarySystemBackground))
        .scrollIndicators(.hidden)
    }
}

// MARK: - PREVIEW

struct SkinsView_Previews: PreviewProvider {
    static var previews: some View {
        SkinListView()
            .environmentObject(ViewModel())
    }
}