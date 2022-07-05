//
//  DrawingManager.swift
//  swift-drawingapp
//
//  Created by Hailey on 2022/07/04.
//

import UIKit

final class CanvasManager {

    private var superView: UIView?
    private var canvasView: UIView?
    private var sketchView: SketchView?

    var squareViews: [SquareView] = []
    var sketcheViews: [DrawingView] = []

    var selectedSquareID: String?

    private var newDrawing: Drawing?

    func start(in superView: UIView) {
        self.superView = superView

        let canvasView = UIView(frame: superView.frame)
        superView.addSubview(canvasView)

        let drawingView = SketchView(frame: superView.frame)
        drawingView.action = self
        drawingView.isUserInteractionEnabled = true
        superView.addSubview(drawingView)

        self.canvasView = canvasView
        self.sketchView = drawingView
    }

    func drawSquare() {
        guard let canvasView = canvasView else { return }

        superView?.bringSubviewToFront(canvasView)

        let square = Square(in: canvasView.frame)
        let squareView = SquareView(square: square)
        squareView.action = self
        squareViews.append(squareView)
        canvasView.addSubview(squareView)
    }

    func startDrawing() {
        guard let drawingView = sketchView else {
            return
        }

        superView?.bringSubviewToFront(drawingView)
    }
}

extension CanvasManager: SquareAction {

    func squareView(_ squareView: SquareView, didSelectSquareOf id: String) {
        squareViews.forEach {
            $0.deselect()
        }

        selectedSquareID = id
    }
}

extension CanvasManager: SketchAction {

    func sketchView(_ sketchView: SketchView, didBeginDrawingWith point: CGPoint) {
        newDrawing = Drawing()
        newDrawing?.coordinates.append(point)
    }

    func sketchView(_ sketchView: SketchView, didMoveDrawingTo point: CGPoint) {
        newDrawing?.coordinates.append(point)
    }

    func sketchView(_ sketchView: SketchView, didEndDrawingWith image: UIImage?) {
        guard var newDrawing = newDrawing,
              let image = image,
              let cgImage = image.cgImage?.cropping(to: newDrawing.rect) else { return }

        let sketchImage = UIImage(cgImage: cgImage,
                                  scale: image.imageRendererFormat.scale,
                                  orientation: image.imageOrientation)
        newDrawing.image = sketchImage

        let sketchView = DrawingView(drawing: newDrawing)
        sketcheViews.append(sketchView)
        canvasView?.addSubview(sketchView)
    }
}
