//
//  LoginView.swift
//  ValorantShop
//
//  Created by 김건우 on 2023/09/14.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - WRAPPER PROPERTIES
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var inputUsername: String = ""
    @State private var inputPassword: String = ""
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            Text("Valorant Shop")
                .font(.custom(Fonts.valorantFont, size: 40))
                .foregroundColor(Color.valorantThemeColor)
            
            Group {
                TextField("아이디", text: $inputUsername)
                SecureField("패스워드", text: $inputPassword)
            }
            .textFieldStyle(.roundedBorder)
            
            Button("로그인") {
                Task {
                    await viewModel.login(
                        username: inputUsername,
                        password: inputPassword
                    )
                }
            }
            .buttonStyle(.borderedProminent)
            
            Button("로그아웃") {
                Task {
                    viewModel.logout()
                }
            }
            .buttonStyle(.borderedProminent)
            
            Button("다운로드") {
                viewModel.isPresentDownloadView = true
            }
        }
        .padding()
        .sheet(isPresented: $viewModel.isPresentMultifactorAuthView) {
            MultifactorAuthView()
        }
        .sheet(isPresented: $viewModel.isPresentDownloadView) {
            DownloadView()
        }
    }
}

// MARK: - PREVIEW

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(ViewModel())
    }
}
