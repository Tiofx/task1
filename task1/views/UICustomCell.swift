//
// Created by Андрей on 24/07/2017.
// Copyright (c) 2017 Tiofx. All rights reserved.
//

import UIKit
import Foundation
import SnapKit
import SDWebImage
import SwiftyJSON

class UICustomCell: UITableViewCell {
    var model: ShortBookDescription! {
        didSet {
            if model != nil {
                titleLabel?.text = model.title
                author?.text = model.author
                imagePreview?.sd_setImage(
                        with: URL(string: (model?.link!)!),
                        placeholderImage: UIImage(named: "resource/placeholder.png"))
            }
        }
    }


    var titleLabel: UILabel!
    var author: UILabel!
    var imagePreview: UIImageView!


    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpComponents()
        setUpStyle()
        setUpConstraints()
    }


    private func setUpComponents() {
        titleLabel = UILabel()
        author = UILabel()
        imagePreview = UIImageView()

        contentView.addSubview(titleLabel)
        contentView.addSubview(author)
        contentView.addSubview(imagePreview)
    }

    private func setUpStyle() {
        contentView.backgroundColor = UIColor.gray

        selectedBackgroundView = UIView()
        selectedBackgroundView!.backgroundColor = UIColor.red

        titleLabel.adjustsFontSizeToFitWidth = false
        titleLabel.text = "TitlePlaceholder TitlePlaceholder TitlePlaceholder TitlePlaceholder TitlePlaceholder TitlePlaceholder"
        titleLabel.backgroundColor = UIColor.blue
        titleLabel.textAlignment = .center

        author.text = "AuthorPlaceholder AuthorPlaceholder AuthorPlaceholder AuthorPlaceholder"
        author.backgroundColor = UIColor.green
    }

    private func setUpConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()

            make.height.equalTo(titleLabel.font.lineHeight)
        }

        author.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.top.greaterThanOrEqualTo(titleLabel.snp.bottom)

            make.centerY.equalTo(imagePreview.snp.centerY)

            make.height.equalTo(author.font.lineHeight)
            make.width.lessThanOrEqualTo(author.intrinsicContentSize.width)
            make.width.lessThanOrEqualToSuperview().multipliedBy(0.5)
            make.width.greaterThanOrEqualToSuperview().multipliedBy(0.2)
        }

        imagePreview.snp.makeConstraints { make in
            make.bottom.right.equalToSuperview().inset(5)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.greaterThanOrEqualTo(author.snp.right).inset(5)

            make.height.greaterThanOrEqualTo(20)
            make.width.equalTo(imagePreview.snp.height)
        }
    }
}
