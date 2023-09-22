//
//  OAuthView.swift
//  ValorantShop
//
//  Created by 김건우 on 2023/09/21.
//

import SwiftUI

struct OAuthView: View {
    
    // MARK: - WRAPPER PROPERTIES
    
    @EnvironmentObject var viewModel: ViewModel
    
    // MARK: - BODY
    
    var body: some View {
        NavigationStack {
            LoginView()
                .overlay {
                    if viewModel.isPresentMultifactorAuthView {
                        MultifactorAuthView()
                    }
                }
                .navigationDestination(isPresented: $viewModel.isPresentDataDownloadView) {
                    DataDownloadView(of: .download)
                        .navigationBarBackButtonHidden()
                    // 네비게이션 백버튼 숨기기
                }
                .navigationBarBackButtonHidden()
        }
        // - For Debug --
        .overlay(alignment: .bottomTrailing) {
            Menu {
                Button("로그아웃") {
                    viewModel.logoutForDeveloper()
                }
                
                Button("다운로드") {
                    viewModel.isPresentDataDownloadView = true
                }
                
                Button("이중인증") {
                    viewModel.isPresentMultifactorAuthView = true
                }
                
                Button("모든 데이터 삭제하기") {
                    viewModel.DeleteAllApplicationDataForDeveloper()
                }
            } label: {
                Text("개발자")
            }
            .padding()
        }
        .onAppear {
            print("다운로드 여부: \(viewModel.isDataDownloaded)")
        }
        // ----------
    }
}

// MARK: - PREVIEW

struct OAuthView_Previews: PreviewProvider {
    static var previews: some View {
        OAuthView()
            .environmentObject(ViewModel())
    }
}