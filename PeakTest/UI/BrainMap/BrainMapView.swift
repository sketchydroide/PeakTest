//
//  BrainMapView.swift
//  test
//
//  Created by Andre_Fonseca on 11/12/2017.
//  Copyright © 2017 Andre_Fonseca. All rights reserved.
//

import UIKit
import CoreGraphics

private enum Metrics {
    static let circleStartRadius: CGFloat = 10.0
    static let circleRadiusIncrease: CGFloat = 10.0
    static let categoryBallRadius: CGFloat = 5.0
    static let lineLenght: CGFloat = 110.0
    static let verticalOffset: CGFloat = 10.0
}

private enum Declaration {
    static let animationTime: TimeInterval = 1.0
    static let graphOpacity: Float = 0.8
    static let circleTotal: Int = 10
    static let colorsAvailable = [UIColor.PeakColor.Blue.lightning,
                                  UIColor.PeakColor.Red.pink,
                                  UIColor.PeakColor.Green.regular,
                                  UIColor.PeakColor.Purple.regular,
                                  UIColor.PeakColor.Red.orange,
                                  UIColor.PeakColor.Blue.regular,
                                  UIColor.PeakColor.Red.regular]
}

class BrainMapView: UIView, ShapeAnimation {
    
    private var yoursGraph: CAShapeLayer?
    private var ageGroupGraph: CAShapeLayer?
    private var professionGraph: CAShapeLayer?
    
    func setup(myBrainMap: BrainScoreModel,
               ageGroupMap: BrainScoreModel,
               professionMap: BrainScoreModel) {
        
        drawTarget(view: self, total: myBrainMap.scores.count)
        addScoreViews(view: self, scores: myBrainMap.scores)
        yoursGraph = drawGraph(view: self, scores: myBrainMap.scores, graphColor: UIColor.PeakColor.Grey.light)
        ageGroupGraph = drawGraph(view: self, scores: ageGroupMap.scores, graphColor: UIColor.PeakColor.Blue.lightning)
        professionGraph = drawGraph(view: self, scores: professionMap.scores, graphColor: UIColor.PeakColor.Red.orange)
        
        guard let yoursGraph = yoursGraph,
            let ageGroupGraph = ageGroupGraph,
            let professionGraph = professionGraph else{
                return
        }
        
        yoursGraph.opacity = Declaration.graphOpacity
        ageGroupGraph.opacity = 0.0
        professionGraph.opacity = 0.0
    }
    
    func showGraph(group: Groups) {
        
        guard let ageGroupGraph = ageGroupGraph,
            let professionGraph = professionGraph else{
                return
        }
        
        switch group {
        case .ageGroup:
            ageGroupGraph.opacity = Declaration.graphOpacity
            animate(shape: ageGroupGraph, animateIn: true, in: self)
            if professionGraph.opacity != 0.0 {
                professionGraph.opacity = 0.0
                animate(shape: professionGraph, animateIn: false, in: self)
            }
        case .profession:
            professionGraph.opacity = Declaration.graphOpacity
            animate(shape: professionGraph, animateIn: true, in: self)
            if ageGroupGraph.opacity != 0.0 {
                ageGroupGraph.opacity = 0.0
                animate(shape: ageGroupGraph, animateIn: false, in: self)
            }
        default:
            if ageGroupGraph.opacity != 0.0 {
                ageGroupGraph.opacity = 0.0
                animate(shape: ageGroupGraph, animateIn: false, in: self)
            }
            if professionGraph.opacity != 0.0 {
                professionGraph.opacity = 0.0
                animate(shape: professionGraph, animateIn: false, in: self)
            }
        }
    }
    
    private func drawTarget(view: UIView, total: Int) {
        drawAllCircles(view: self, total: Declaration.circleTotal)
        drawLines(view: view, total: total)
    }
    
    private func drawAllCircles(view: UIView, total: Int) {
        var circleRadius = Metrics.circleStartRadius
        var isLighterColor = true
        for _ in 1...total {
            let circleColor = isLighterColor ? UIColor.PeakColor.Grey.regular : UIColor.PeakColor.Grey.light
            
            drawCircle(with: circleColor,
                       with: circleRadius,
                       at: makeFrameCenter(view: view))
            
            circleRadius += Metrics.circleRadiusIncrease
            isLighterColor = !isLighterColor
        }
    }
    
    private func drawLines(view: UIView,
                           total: Int) {
        let angles = makeAngleForScores(total: total)
        var currentAngle = angles.startAngle
        
        for index in 0..<total {
            
            let viewCenter = makeFrameCenter(view: view)
            let endPoint = CGPoint(at: Metrics.lineLenght,
                                   from: viewCenter,
                                   with: currentAngle)
            let ballPoint = CGPoint(at: Metrics.lineLenght + Metrics.categoryBallRadius,
                                    from: viewCenter,
                                    with: currentAngle)
            
            drawLine(starting: makeFrameCenter(view: view),
                     ending: endPoint,
                     and: UIColor.PeakColor.Grey.light)
            
            drawCircle(with: Declaration.colorsAvailable[index],
                       with: Metrics.categoryBallRadius,
                       at: ballPoint)
            
            //Update Current Angle for next iteration
            currentAngle += angles.angleBetweenLines
        }
    }
    
    private func addScoreViews(view: UIView,
                               scores: [ScoreModel]) {
        let angles = makeAngleForScores(total: scores.count)
        var currentAngle = angles.startAngle
        
        for index in 0..<scores.count {
            let viewCenter = makeFrameCenter(view: view)
            let offsetPoint = CGPoint(at: Metrics.lineLenght + Metrics.categoryBallRadius,
                                      from: viewCenter,
                                      with: currentAngle)
            
            let scoreView = makeScoreView(score: scores[index],
                                          isFirstView: index == 0,
                                          targetCenter: viewCenter,
                                          position: offsetPoint)
            
            self.addSubview(scoreView)
            
            //Update Current Angle for next iteration
            currentAngle += angles.angleBetweenLines
        }
    }
    
    private func drawGraph(view: UIView,
                           scores: [ScoreModel],
                           graphColor: UIColor) -> CAShapeLayer? {
        let angles = makeAngleForScores(total: scores.count)
        var currentAngle = angles.startAngle
        var graphPoints: Array<CGPoint> = []
        
        for index in 0..<scores.count {
            let score = scores[index]
            let distanceToCenter = Metrics.lineLenght * CGFloat(score.value)/CGFloat(score.maxScore)
            let graphPoint = CGPoint(at: distanceToCenter,
                                     from: makeFrameCenter(view: view),
                                     with: currentAngle)
            
            graphPoints.append(graphPoint)
            //Update Current Angle for next iteration
            currentAngle += angles.angleBetweenLines
        }
        
        return drawShape(points: graphPoints,
                         color: graphColor)
    }
    
    private func makeScoreView(score: ScoreModel,
                               isFirstView: Bool,
                               targetCenter: CGPoint,
                               position: CGPoint) -> ScoreView {
        
        let scoreView: ScoreView = UIView.fromNib()
        scoreView.setup(score: score,
                        isMultilineTitle: !isFirstView)
        
        let originX = position.x - scoreView.frame.width/2.0
        let originY: CGFloat
        
        if position.y < targetCenter.y {
            originY = position.y - Metrics.verticalOffset - scoreView.frame.height
        } else {
            originY = position.y + Metrics.verticalOffset
        }
        
        scoreView.frame = CGRect(origin: CGPoint(x: originX, y: originY), size: scoreView.frame.size)
        
        return scoreView
    }
    
    //MARK: - Math calculations for angles and points
    
    private func makeAngleForScores(total: Int) -> (angleBetweenLines: CGFloat, startAngle: CGFloat) {
        let angleBetweenLines = CGFloat.pi*2.0/CGFloat(total)
        let startAngle = -CGFloat.pi/2.0
        return (angleBetweenLines, startAngle)
    }
}


