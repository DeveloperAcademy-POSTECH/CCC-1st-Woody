//
//  AppView.swift
//  Appstore
//
//  Created by Woody on 2022/06/05.
//

import SwiftUI

struct AppDownloadView: View {
    static let imageSize: CGSize = CGSize(width: 50, height: 50)
    static let cellHeight: CGFloat = 80.0
    var body: some View {
        HStack {
            Image("photo2")
                .resizable()
                .frame(width: AppDownloadView.imageSize.width,
                       height: AppDownloadView.imageSize.height,
                       alignment: .center)
                .cornerRadius(15)
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("유미의 세포들 더 퍼즐")
                            .font(.system(size: 20))
                        Text("캐주얼")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button {
                        print("press")
                    } label: {
                        Image(systemName: "icloud.and.arrow.down")
                            .resizable()
                            .frame(width: 20,
                                   height: 20,
                                   alignment: .center)
                    }
                }
            }
        }
    }
}

struct AppDownloadView_Previews: PreviewProvider {
    static var previews: some View {
        AppDownloadView()
    }
}
