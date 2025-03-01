//
//  SFCopyrightView.swift
//  SFBusiness
//
//  Created by hsf on 2024/11/22.
//

import Foundation
import UIKit
// Basic
import SFExtension
import SFBase
// UI
import SFUI

// MARK: - SFCopyrightView
public class SFCopyrightView: SFView {
    // MARK: life cycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        customUI()
    }
    
    // MARK: ui
    public private(set) lazy var versionLabel: SFLabel = {
        return SFLabel().then { view in
            view.font = .systemFont(ofSize: 10, weight: .regular)
            view.textColor = SFColor.UI.subtitle
            view.text = String(format: SFText.Business.version, SFApp.version, SFApp.build)
            view.textAlignment = .center
        }
    }()
    public private(set) lazy var copyrightLabel: SFLabel = {
        return SFLabel().then { view in
            view.font = .systemFont(ofSize: 10, weight: .regular)
            view.textColor = SFColor.UI.subtitle
            view.text = SFText.Business.copyright
            view.textAlignment = .center
        }
    }()
    private func customUI() {
        addSubview(versionLabel)
        addSubview(copyrightLabel)
        
        versionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.leading.greaterThanOrEqualToSuperview()
            make.trailing.lessThanOrEqualToSuperview()
        }
        copyrightLabel.snp.makeConstraints { make in
            make.top.equalTo(versionLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.leading.greaterThanOrEqualToSuperview()
            make.trailing.lessThanOrEqualToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
