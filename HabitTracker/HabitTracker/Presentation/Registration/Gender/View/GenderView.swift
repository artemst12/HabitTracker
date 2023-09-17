//
//  GenderView.swift
//  HabitTracker
//
//  Created by Артем Ступников on 28.06.2023.
//

import UIKit

final class GenderView: UIViewController {
    
    var output: GenderViewOutput?
    
    private let historyScreens = StackScreenView()
    
    private let titleLabel = StyledLabel(
        font: .systemFont(ofSize: Fonts.titleSize, weight: Weigth.bold),
        color: Colors.white
    )
    
    private let descriptionLabel = StyledLabel(
        font: .systemFont(ofSize: Fonts.descriptionSize, weight: Weigth.medium),
        color: Colors.lightGray
    )
    
    private var genderCollectionView: UICollectionView!
    private var genderCollectionViewAdapter: GenderCollectionViewAdapter?

    // TODO: Кнопки должны быть массивом в CollectionView
    private let maleButton = CustomGenderButton()
    private let femaleButton = CustomGenderButton()
    
    private let data: [EmojiItems] = []
    
    private let skipButton = UIButton()
    
    private let nextButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        output?.getItems()
    }
}

// MARK: GenderViewInput
extension GenderView: GenderViewInput {

    // TODO: конфиг по массиву кнопок, а не отдельное свойство для каждой кнопки
    func updateButtons(_ buttons: [EmojiItems]) {
        genderCollectionViewAdapter?.set(data: buttons)
        genderCollectionViewAdapter?.reload()
    }
}

// MARK: - GenderCollectionViewAdapterOutput
extension GenderView: GenderCollectionViewAdapterOutput {

    func selected(model: EmojiItems) {
        print(model.genderLabel)
        genderCollectionViewAdapter?.select(item: model)
    }
}

//MARK: - Private methods
private extension GenderView {
    
    func setupUI() {
        setupView()
        setupLabels()
        setupSkipButton()
        setupButtons()
        setupCollectionView()
        setupConstrains()
    }
    
    func setupView() {
        view.backgroundColor = Colors.background
        
        view.addSubview(historyScreens)
        historyScreens.setScreenColor(welcomeColor: .white, informationColor: .white, genderColor: .white, congratsColor: .darkGray)
    }
    
    func setupLabels() {
        view.addSubview(titleLabel)
        titleLabel.text = "What's your gender?".localized()
        
        view.addSubview(descriptionLabel)
        descriptionLabel.text = "To make sure we recommended the right settings for you. :)".localized()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: 160, height: 180)
//        layout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20)
//        layout.minimumInteritemSpacing = 2
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize

        genderCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        genderCollectionView.translatesAutoresizingMaskIntoConstraints = false
        genderCollectionView.backgroundColor = .clear
        genderCollectionView.alwaysBounceHorizontal = true
        view.addSubview(genderCollectionView)

        genderCollectionViewAdapter = GenderCollectionViewAdapter(
            data: [],
            collectionView: genderCollectionView,
            output: self
        )
        
        genderCollectionView.delegate = genderCollectionViewAdapter
        genderCollectionView.dataSource = genderCollectionViewAdapter
    }
    
    func setupSkipButton() {
        view.addSubview(skipButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.setTitle("Skip", for: .normal)
        skipButton.setTitleColor(.lightGray, for: .normal)
        skipButton.titleLabel?.font = .systemFont(ofSize: 16)
        skipButton.backgroundColor = .clear
        
        skipButton.addAction(.init(handler: { [weak self] action in
            self?.output?.nextButtonTapped()
        }), for: .touchUpInside)
    }
    
    func setupButtons() {
        view.addSubview(nextButton)
        nextButton.setTitle("Next".localized(), for: .normal)
        nextButton.addAction(.init(handler: { [weak self] action in
            self?.output?.nextButtonTapped()
        }), for: .touchUpInside)
    }

    func setupConstrains() {
        NSLayoutConstraint.activate([
            
            historyScreens.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            historyScreens.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            historyScreens.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            genderCollectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 25),
            genderCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            genderCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            genderCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            skipButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            nextButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
