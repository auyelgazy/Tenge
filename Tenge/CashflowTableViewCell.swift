//
//  CashflowTableViewCell.swift
//  Tenge
//
//  Created by Kuanysh al-Khattab Auyelgazy on 18.04.2023.
//

import UIKit
import SnapKit

final class CashflowTableViewCell: UITableViewCell {

    static let identifier = "cashflowCell"

    var cashflow: Cashflow? {
        didSet {
            categoryLabel.text = cashflow?.category.rawValue
            let valueString = "\(cashflow?.value ?? 0)"
            let valueTypeString = cashflow?.cashflowType == .income ? "+ " : "- "
            valueLabel.text = valueTypeString + valueString + " ₸"
            valueLabel.textColor = cashflow?.cashflowType == .income ? .systemGreen : .systemRed
        }
    }

    // MARK: - UI

    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()

    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Setup

    private func setupView() {
        contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
        contentView.backgroundColor = .black
        contentView.addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(categoryLabel)
        labelsStackView.addArrangedSubview(valueLabel)
    }

    private func setupLayout() {
        labelsStackView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-15)
        }
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        cashflow = nil
    }
}
