//
//  SFAgreementView.swift
//  SFUser
//
//  Created by hsf on 2024/11/19.
//

import Foundation
import UIKit
// Basic
import SFExtension
import SFBase
// UI
import SFUI

// MARK: - SFAgreementView
public class SFAgreementView: SFView {
    // MARK: life cycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        let hitInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        self.hitInsets = hitInsets
        checkBoxBtn.hitInsets = hitInsets
        customUI()
    }
    
    // MARK: ui
    public private(set) lazy var checkBoxBtn: SFButton = {
        return SFButton().then { view in
            view.setImage(SFImage.UI.Checkbox.nor, for: .normal)
            view.setImage(SFImage.UI.Checkbox.sel, for: .selected)
            view.addTarget(self, action: #selector(checkBoxBtnClicked), for: .touchUpInside)
        }
    }()
    public private(set) lazy var titleLabel: SFLabel = {
        return SFLabel().then { view in
            view.font = .systemFont(ofSize: 12, weight: .regular)
            view.textColor = SFColor.UI.subtitle
            view.text = String(format: SFText.Business.agreement, SFText.Business.agreement_policy, SFText.Business.agreement_term)
        }
    }()
    
    private func customUI() {
        addSubview(checkBoxBtn)
        addSubview(titleLabel)
        
        checkBoxBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
            make.leading.equalToSuperview()
            make.width.height.equalTo(20)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(checkBoxBtn.snp.trailing)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - action
extension SFAgreementView {
    @objc private func checkBoxBtnClicked() {
        checkBoxBtn.toggleSelected()
    }
}

