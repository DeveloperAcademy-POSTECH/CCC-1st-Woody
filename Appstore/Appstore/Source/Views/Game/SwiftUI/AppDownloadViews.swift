//
//  AppDownloadViews.swift
//  Appstore
//
//  Created by Woody on 2022/06/05.
//

import SwiftUI

struct AppDownloadViews: View {
    private let divideLine: CGFloat = AppDownloadView.imageSize.width + 10 + 32
    static let spacing: CGFloat = 5
    // MARK: 데이터를 뿌리게 된다면 ForEach문으로 변경
    var body: some View {
        VStack(alignment: .trailing, spacing: AppDownloadViews.spacing) {
            AppDownloadView()
            Divider().frame(width: DeviceInfo.width - divideLine,
                       height: 1,
                       alignment: .trailing)
            AppDownloadView()
            Divider().frame(width: DeviceInfo.width - divideLine,
                       height: 1,
                       alignment: .trailing)
            AppDownloadView()
        }
    }
}

struct AppDownloadViews_Previews: PreviewProvider {
    static var previews: some View {
        AppDownloadViews()
    }
}
