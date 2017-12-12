//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 関口 聡 on 2017/12/11.
//  Copyright © 2017年 gucci1003. All rights reserved.
//





import UIKit





class ZoomViewController: UIViewController {

    
// 画面上の要素を変数として定義する
    
    // 画像拡大表示エリア
    @IBOutlet weak var zoompic: UIImageView!
    
    
// 必要な変数を定義する
    
    // 呼び出す可能性のある画像をとりまとめて扱う配列
    let imageNameArray = [
        "lake.jpg",
        "mountain.jpg",
        "city.jpg",
        "sea.jpg",
        ]
    
    // 拡大表示する画像の番号
    var zoomImageNo = 0
    
    
// 画面の遷移前後の状態を定義する
    
    // 画面の初期状態
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // zoomimageという定数の定義としてzoomImageNo（=dispImageNo）、すなわち前画面で表示されていた画像を与える
        let zoomimage = UIImage(named: imageNameArray[zoomImageNo])
        
        // 画面拡大表示エリアの変数であるzoompicに直前で定義したzoomimageを代入する
        zoompic.image = zoomimage
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
     
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
