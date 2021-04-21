//
//  Diagonal_CustomImageView.swift
//  CodeLayout_Connect_Storyboard
//
//  Created by Derrick kim on 2021/04/21.
//

import UIKit


@IBDesignable
class Diagonal_CustomImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
    // 대각선으로 잘린 사각형을 그린다.
    // BezierPath
    
    // path -> layer
    
    // layer -> mask
    
    // 내가 만든 커스텀 코드. -> storyboard 편집화면에서 바로 확인
    
    // 1. 그려라
    
    // 값 설정을 Main.Storyboard 상에서 설정하고 싶을때.
    @IBInspectable var innerHeight : CGFloat = 0
    
    
    func makePath() -> UIBezierPath{
        let path = UIBezierPath()
//        path.move(to: CGPoint.init(x: 0, y: 0)) // move 가 시작점
        path.move(to: CGPoint.zero) // move 가 시작점
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0)) // 오른쪽 끝까지간다.
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height)) // 오른쪽 갔으니까 이제 내려간다.(높이만큼)
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height - innerHeight)) // 이제 왼쪽으로 간다.
        path.close()// 끝에 그린게 마침을 찍어줌 자동으로.
        
        return path
    }
    
    // 2.
    func pathToLayer() -> CAShapeLayer{
        let shapeLayer = CAShapeLayer()
        // 기본 Object는 path를 거쳐갈수 없기 떄문에 path를 거쳐서 간다.
        
        //  UIBezierPath -> CGPath화 시킴.
        shapeLayer.path = makePath().cgPath
        return shapeLayer
    }
    
    // 3.
    // 이제 마스크 씌운다
    func makeMask(){
        self.layer.mask = pathToLayer()
    }
    
    // 4.
    // 그려질때
    override func layoutSubviews() {
        makeMask()
    }
    
}
