// https://swiftwithmajid.com/2021/10/28/blur-effect-and-materials-in-swiftui/
//  CurrentProgressAppView.swift
//  Appstore
//
//  Created by Woody on 2022/06/08.
//

import SwiftUI
import UIKit

struct CurrentProgressAppView: View {
    static let imageSize: CGSize = CGSize(width: DeviceInfo.width - 32, height: (DeviceInfo.width - 32) * 3 / 4)
    var body: some View {
        VStack {
            Divider()
                .frame(width: DeviceInfo.width - 32, height: 1, alignment: .center)
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("현재 진행 중")
                            .font(.system(size: 9, weight: .bold))
                            .foregroundColor(.blue)
                        Text("Pokemon Go")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                        Text("독점 쉐이미를 포획하세요")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.bottom, 10)
                ZStack {
                    Image("pokemongo")
                        .resizable()
                        .cornerRadius(10)
                    VStack {
                        Color.clear
                            .frame(height: CurrentProgressAppView.imageSize.height * 3 / 4,
                                   alignment: .center)
                        Spacer()
                        HStack {
                            Image("photo2")
                                .resizable()
                                .frame(width: 30,
                                       height: 30,
                                       alignment: .center)
                                .cornerRadius(10)
                                .padding(.leading, 16)
                            VStack {
                                HStack {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Pokemon Go")
                                            .font(.system(size: 13))
                                            .foregroundColor(.white)
                                        Text("전 세계에서 포켓몬을 발견하자")
                                            .font(.system(size: 12))
                                            .foregroundColor(.white.opacity(0.8))
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
                                            .tint(.white)
                                    }
                                }
                            }
                            .padding(.trailing, 20)
                        }
                        .padding([.bottom, .top], 10)
                        .background(VisualEffect(style: .systemThinMaterialDark))
                        .cornerRadius(radius: 10, corners: [.bottomLeft, .bottomRight])
                    }
                }
                .clipped()
                .frame(width: CurrentProgressAppView.imageSize.width,
                       height: CurrentProgressAppView.imageSize.height,
                       alignment: .center)
                
                Spacer()
            }
        }
        
    }
}

struct CurrentProgressAppView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentProgressAppView()
    }
}
