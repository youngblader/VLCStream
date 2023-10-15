//
//  PlayerViewController.swift
//  VLCStream
//
//  Created by Евгений Зорич on 15.10.23.
//

import UIKit
import MobileVLCKit
import SnapKit

private let url = "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"

final class PlayerViewController: UIViewController {
    let player = VLCMediaPlayer()
    
    //MARK: UI
    let playerContainerView = UIView()
    
    private lazy var playButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Play", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 14)
        
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(playStream), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var pauseButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Pause", for: .normal)
        
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 14)
        
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(pauseStream), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        startStream()
    }
    
    private func startStream() {
        guard let streamUrl = URL(string: url) else { return }
        
        let media = VLCMedia(url: streamUrl)
        
        player.media = media
        player.drawable = playerContainerView
        
        player.play()
    }
    
    //MARK: Actions
    @objc private func playStream() {
        player.play()
    }
    
    @objc private func pauseStream() {
        player.pause()
    }
}

extension PlayerViewController {
    private func setupViews() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(playerContainerView)
        
        self.view.addSubview(playButton)
        self.view.addSubview(pauseButton)
    }
    
    private func setupConstraints() {
        playerContainerView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.right.bottom.equalTo(self.view)
        }
        
        playButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.left.equalTo(self.view).inset(14)
        }
        
        pauseButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.right.equalTo(self.view).inset(14)
        }
    }
}
