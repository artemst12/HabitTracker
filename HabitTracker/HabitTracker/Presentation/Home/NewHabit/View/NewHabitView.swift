//
//  NewHabitView.swift
//  HabitTracker
//
//  Created by Артем Ступников on 03.11.2023.
//

import UIKit

func anyfunc() {
    let parentVC = UIApplication.shared.keyWindow?.rootViewController

    let vc = NewHabitView(nibName: nil, bundle: nil)

    // UINavigationController().addSubview()
    parentVC?.present(vc, animated: true)
}

final class NewHabitView: UIViewController {
    
    var output: NewHabitViewOutput?

//    let containerView = UIView()
//    var view: UIView! = .init()
//
//    var view: UIView! = {
//        let uiview = UIView(frame: .zero)
//        uiview.backgroundColor = .white
//        return uiview
//    }()

    private var NewHabitTableView = UITableView()
    private var newHabitTableViewAdapter: NewHabitTableViewAdapter?
    
    private var doneButton = CustomButton()
    private let backButton = UIButton(type: .custom)
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }

//    override func loadView() {
//        super.loadView()
//        self.view = containerView
//        self.view.topAnchor
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

//        self.view.addSubview(containerView)
//        view.backgroundColor = .red
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // code ...
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    // animation ... 0.3sec

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }


    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    // animation ... 0.3sec

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    deinit { }
}

extension NewHabitView: NewHabitTableCellProtocol {
    func checkBoxActive() {
        doneButton.isEnabled = true
        doneButton.backgroundColor = Colors.lightGreen
        doneButton.setTitleColor(.black, for: .normal)
    }
}

extension NewHabitView: NewHabitViewInput {
    
    func updateView(data: [NewHabitStruct]) {
        newHabitTableViewAdapter?.set(data: data)
        newHabitTableViewAdapter?.reload()
    }
}

private extension NewHabitView {
    
    func setupUI() {
        setupView()
        setupTableView()
        setupButton()
        setupConstraints()
    }

    func setupView() {
        view.backgroundColor = Colors.background

        let backTitledButton = BackTitledButton(
            title: "Add new habit",
            type: .crosshair) { [weak self] in
                self?.output?.backButtonTapped()
            }

        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = .init(customView: backTitledButton)
    }
    
    @objc func backButtonTapped() {
        output?.backButtonTapped()
    }
    
    func setupTableView() {
        view.addSubview(NewHabitTableView)
        NewHabitTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let items = output?.getItems() ?? []
        newHabitTableViewAdapter = NewHabitTableViewAdapter(tableView: NewHabitTableView, data: items)
    }
    
    func setupButton() {
        view.addSubview(doneButton)
        doneButton.setTitle("Done".localized(), for: .normal)
        doneButton.addAction(.init(handler: { [weak self] action in
            self?.output?.doneButtonTapped()
        }), for: .touchUpInside)
        doneButton.isEnabled = true
        doneButton.backgroundColor = Colors.disable
        doneButton.setTitleColor(.white, for: .normal)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            NewHabitTableView.topAnchor.constraint(equalTo: view.topAnchor),
            NewHabitTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            NewHabitTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            NewHabitTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            doneButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
