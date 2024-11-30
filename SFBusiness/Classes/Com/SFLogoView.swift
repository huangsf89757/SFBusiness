//
//  SFLogoView.swift
//  SFBusiness
//
//  Created by hsf on 2024/11/23.
//

import Foundation
import UIKit
// Basic
import SFExtension
import SFBase
// UI
import SFUI

public class SFLogoView: SFView {
    // MARK: life cycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        customUI()
    }
    
    // MARK: ui
    public private(set) lazy var logoImgView: SFImageView = {
        return SFImageView().then { view in
            view.contentMode = .scaleAspectFit
            view.backgroundColor = SFColor.UI.content
            view.image = SFImage.App.icon
            view.layer.cornerRadius = 8
            view.layer.masksToBounds = true
        }
    }()
    public private(set) lazy var nameLabel: SFLabel = {
        return SFLabel().then { view in
            view.font = .systemFont(ofSize: 17, weight: .bold)
            view.textColor = SFColor.UI.title
            view.textAlignment = .center
            view.text = SFText.App.name
        }
    }()
    public private(set) lazy var slogenLabel: SFLabel = {
        return SFLabel().then { view in
            view.font = .systemFont(ofSize: 12, weight: .regular)
            view.textColor = SFColor.UI.subtitle
            view.textAlignment = .center
            view.text = SFText.App.slogen
        }
    }()
    private func customUI() {
        addSubview(logoImgView)
        addSubview(nameLabel)
        addSubview(slogenLabel)
        
        logoImgView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImgView.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        slogenLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
