//
//  PlayerViewController.swift
//  VLCStream
//
//  Created by Евгений Зорич on 15.10.23.
//

import UIKit

final class PlayerViewController: UIViewController {
    private var playerView: PlayerView {
        return self.view as! PlayerView
    }
    
    override func loadView() {
        self.view = PlayerView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
