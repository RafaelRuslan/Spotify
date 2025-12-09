//
//  CustomSlider.swift
//  Spotify
//
//  Created by Rafael Agayev on 24.08.25.
//

import SwiftUI
import AVFoundation

struct CustomSlider: UIViewRepresentable {
    
    @Binding var value: Double
    
    var range: ClosedRange<Double>
    
    var onEditingChanged: (Bool) -> Void = { _ in }
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = Float(range.lowerBound)
        slider.maximumValue = Float(range.upperBound)
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        slider.addTarget(context.coordinator, action: #selector(Coordinator.touchDown(_:)), for: .touchDown)
        slider.addTarget(context.coordinator, action: #selector(Coordinator.touchUp(_:)), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        slider.minimumTrackTintColor = UIColor.white
        slider.maximumTrackTintColor = UIColor.gray
        slider.thumbTintColor = UIColor.white
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: CustomSlider
        var isDragging = false
        
        init(_ parent: CustomSlider) {
            self.parent = parent
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            parent.value = Double(sender.value)
            if isDragging {
                parent.onEditingChanged(true)
            }
        }
        
        @objc func touchDown(_ sender: UISlider) {
            isDragging = true
            parent.onEditingChanged(true)
        }
        
        @objc func touchUp(_ sender: UISlider) {
            isDragging = false
            parent.onEditingChanged(false)
        }
    }
}
