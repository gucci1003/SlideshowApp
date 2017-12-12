//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 関口 聡 on 2017/12/11.
//  Copyright © 2017年 gucci1003. All rights reserved.
//





import UIKit





class ViewController: UIViewController {
    
    
// 画面上の要素を変数として定義する
    
    // 画像表示エリア
    @IBOutlet weak var imageview: UIImageView!
    
    // 前へボタン
    @IBOutlet weak var prev: UIButton!
    
    // 次へボタン
    @IBOutlet weak var nextbutton: UIButton!
    
    // 再生／停止ボタン
    @IBOutlet weak var playpause: UIButton!
    
    
// 必要な変数を定義する
    
    // 呼び出す可能性のある画像をとりまとめて扱う配列
    let imageNameArray = [
        "lake.jpg",
        "mountain.jpg",
        "city.jpg",
        "sea.jpg",
        ]

    // 表示する画像の番号
    var dispImageNo = 0

    // ★タイマーそのもの？
    var timer: Timer!
    
    // カウント間隔に関わらず、1枚ずつ画像をスライドさせるための定数
    let timer_sec: Int = 1

    
// 画面の遷移前後の状態を定義する
    
    // 画面の初期状態
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // imageという定数の定義として最初の画像のUIImageを与える
        let image = UIImage(named: imageNameArray[dispImageNo])
        
        // 画像表示エリアの変数であるimageviewに直前に定義したimageを代入する
        imageview.image = image
    }
    
    
    // ★不明（ライフサイクルにも定義なし）
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    
    // 画面遷移するときの状態
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // segueから遷移先のZoomViewControllerを取得し、zoomViewControllerという定数として定義する
        let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
        
        // 遷移先のzoomViewControllerで宣言しているzoomImageNoに値を代入して渡す
        zoomViewController.zoomImageNo = dispImageNo
        
        // タイマーが動作している場合、
        if self.timer != nil {
            
            // 現在のタイマーを破棄する
            self.timer.invalidate()
            
            // 初期状態に戻す
            self.timer = nil
            
            // ボタンも元に戻す
            prev.isEnabled = true
            nextbutton.isEnabled = true
            playpause.setTitle("再生", for: .normal)
        
        }
    }
    
    
    
// アプリ内で使うメソッドを定義する
    
    // 2つのボタンで表示する画像を切替えるメソッド
    func displayImage() {
        
        if dispImageNo > imageNameArray.count - 1 {
            dispImageNo = 0
        }
        
        if dispImageNo < 0 {
            dispImageNo = imageNameArray.count - 1
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageview.image = image
    }
    
    
    // 時間経過で表示する画像を切替えるメソッド
    func updateTimer(timer: Timer) {
        
        // 表示する画像のNoがタイマーに合わせて変更になるようにする
        dispImageNo = (dispImageNo + timer_sec) % imageNameArray.count
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageview.image = image
        
    }
    

// 画面上で起こしうるアクションを定義する
    
    // 前へボタンの挙動を定義する
    @IBAction func prev(_ sender: Any) {
        
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        
        // 表示している画像の番号を元に画像を表示するメソッドを使う
        displayImage()
    }
    
    // 次へボタンの挙動を定義する
    @IBAction func next(_ sender: Any) {
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    // 再生／停止ボタンの挙動を定義する
    @IBAction func slideshow(_ sender: Any) {
        
        // タイマーがない場合の挙動
        if self.timer == nil {
            
            // 2秒ごとにupdateTimerのアクションを繰り返し起こす
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            // 上記の間、3つのボタンの挙動を変える
            prev.isEnabled = false
            nextbutton.isEnabled = false
            playpause.setTitle("停止", for: .normal)
        }
            
        // タイマーが動作している場合、
        else if self.timer != nil {
            
            // 現在のタイマーを破棄する
            self.timer.invalidate()
            
            // 初期状態に戻す
            self.timer = nil
            
            // ボタンも元に戻す
            prev.isEnabled = true
            nextbutton.isEnabled = true
            playpause.setTitle("再生", for: .normal)
            
        }
    }
    
    
    // 遷移先から戻ってこれるようにする
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    

}

