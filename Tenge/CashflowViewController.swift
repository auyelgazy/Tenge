//
//  CashflowViewController.swift
//  Tenge
//
//  Created by Kuanysh al-Khattab Auyelgazy on 17.04.2023.
//

import UIKit
import SnapKit

final class CashflowViewController: UIViewController {

    private var cashflowList: [Cashflow] = []

    // MARK: - UI

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CashflowTableViewCell.self, forCellReuseIdentifier: CashflowTableViewCell.identifier)
        tableView.separatorColor = .darkGray
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = UIEdgeInsets.zero
        return tableView
    }()

    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Balance:"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .white
        return label
    }()

    private lazy var currentBalanceLabel: UILabel = {
        let label = UILabel()
        label.text = "250 000 ₸"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .white
        return label
    }()

    private lazy var balanceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        button.setTitle("New", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 14
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }

    // MARK: - Setup

    private func setupView() {
        cashflowList = Cashflow.list
        view.backgroundColor = .black
        view.addSubview(tableView)
        view.addSubview(balanceStackView)
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(currentBalanceLabel)
        view.addSubview(addButton)
    }

    private func setupLayout() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-200)
        }

        balanceStackView.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerX.equalToSuperview()
        }

        currentBalanceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview()
        }

        addButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(60)
            $0.trailing.equalToSuperview().offset(-60)
            $0.height.equalTo(50)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
    }

    // MARK: - Actions

    @objc
    private func addButtonPressed() {
        print("add")
    }
}

extension CashflowViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cashflowList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CashflowTableViewCell.identifier, for: indexPath) as! CashflowTableViewCell
        cell.cashflow = cashflowList[indexPath.row]
        return cell
    }
}
