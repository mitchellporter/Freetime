//
//  IssueStatusCell.swift
//  Freetime
//
//  Created by Ryan Nystrom on 6/4/17.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import UIKit
import IGListKit
import SnapKit

final class IssueStatusCell: UICollectionViewCell, IGListBindable {

    let button = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)

        button.setupAsLabel()
        contentView.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(Styles.Sizes.gutter)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: IGListBindable

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? IssueStatusModel else { return }

        button.setBackgroundColor(closed: viewModel.closed)
        button.setStatusIcon(pullRequest: viewModel.pullRequest, closed: viewModel.closed)
        button.setTitle(viewModel.closed ? Strings.closed : Strings.open, for: .normal)
    }

}
