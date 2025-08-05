//
//  AudioPlayer.swift
//  Spotify
//
//  Created by Rafael Agayev on 05.08.25.
//

import Foundation
import AVFoundation
import CoreData
import SwiftUICore
import UIKit
import CoreImage

class AudioPlayerViewModel: ObservableObject {
    @Published var progress: Double = 0.0
    @Published var rotation: Double = 0
    @Published var isRotating: Bool = false
    @Published var isPlaying: Bool = false
    @Published var currentTime: String = "0:00"
    @Published var durationTime: String = "0:00"
    
    var newSong: SongCDModel?
    private var modelContext: NSManagedObjectContext

        init(modelContext: NSManagedObjectContext) {
            self.modelContext = modelContext
            songCurrent = songs[currentIndex]
        }

    @Published var songCurrent: Song?

    var songs: [Song] = [
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000001") ?? UUID(), name: "Yeaf: If We Being Real (Slowed & Reverb)", fileName: "If We Being Real", imageSong: "Yeaf", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000002") ?? UUID(), name: "Mustafa Ceceli - Al gotur beni", fileName: "Mustafa Ceceli  ft Lara Fabian - Al Gotur Beni", imageSong: "AlGoturBeni", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000003") ?? UUID(), name: "Xpert & Eminem - Yaxsi (Remix)", fileName: "Xpert ft Drake & Eminem Yaxsi Remix", imageSong: "XpertEminem", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000004") ?? UUID(), name: "Demet Akalin - Yerinde dur", fileName: "Sefo & Demet Akalin - Yerinde Dur", imageSong: "yerindeDur", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000005") ?? UUID(), name: "Damla - Serefsiz", fileName: "Damla - Serefsiz", imageSong: "DamlaSerefsiz", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000007") ?? UUID(), name: "Adele - Skyfall", fileName: "Adele - Skyfall", imageSong: "AdeleSkyfall", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000008") ?? UUID(), name: "Avicii - Wake me up", fileName: "Avicii ft Pitbull - Wake Me Up (Worldwide Remix)", imageSong: "AviciiWakeMeUp", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000009") ?? UUID(), name: "Eminem ft Rihanna - The Monster", fileName: "Eminem ft Rihanna - The Monster", imageSong: "EminemMonster", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000010") ?? UUID(), name: "Calvin Harris - We Found Love ft Rihanna", fileName: "Calvin Harris - We Found Love ft Rihanna", imageSong: "WeFoundLove", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000011") ?? UUID(), name: "Inna - Hot", fileName: "inna - Hot", imageSong: "InnaHot", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000012") ?? UUID(), name: "Inna - INNdia (dj colorit Remix)", fileName: "inna - Inndia", imageSong: "InnaInndia", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000013") ?? UUID(), name: "Inna - Yalla", fileName: "Inna - Yalla", imageSong: "InnaYalla", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000014") ?? UUID(), name: "Gotye ft. Kimbra - Somebody That i Used To Know", fileName: "Gotye ft. Kimbra - Somebody That i Used To Know", imageSong: "GotyeSomebody", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000015") ?? UUID(), name: "Maroon 5 - Lost Stars", fileName: "Maroon 5 - Lost Stars", imageSong: "Maroon5", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000016") ?? UUID(), name: "P Diddy ft Cristina Aguilera - Tell me", fileName: "P Diddy - Tell Me (ft Christina Aguilera)", imageSong: "DiddyTellMe", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000017") ?? UUID(), name: "Aygun Kazimova - Can ol", fileName: "Aygun Kazimova - Can ol", imageSong: "AygunCanOl", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000018") ?? UUID(), name: "Enrique Iglesias - Heartbeat ft Nicole Scherzinger", fileName: "Enrique Iglesias - Heartbeat ft Nicole Scherzinger", imageSong: "HeartbeatEnrique", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000019") ?? UUID(), name: "Inna - Cola Song ft J Balvin", fileName: "Inna - Cola Song ft J Balvin", imageSong: "InnaColaSong", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000020") ?? UUID(), name: "Pitbull - Suavemente  Nayer ft Mohombi", fileName: "Pitbull - Suavemente  Nayer ft Mohombi", imageSong: "NayerSuavemente", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000021") ?? UUID(), name: "Lost Frequencies - Are You With Me", fileName: "Lost Frequencies - Are You With Me", imageSong: "AreYouWithMe", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000022") ?? UUID(), name: "Alexandra Stan - Kiss Me Goodbye", fileName: "Alexandra Stan - Kiss Me Goodbye", imageSong: "AlexandraStanKissme", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000023") ?? UUID(), name: "Shahmen - Mark", fileName: "Shahmen - Mark", imageSong: "ShahmenMark", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000024") ?? UUID(), name: "Britney Spears - Gimme more", fileName: "Britney Spears - Gimme more", imageSong: "BritneyGimmeGimme", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000025") ?? UUID(), name: "Clean Bandit - Stronger", fileName: "Clean Bandit - stronger", imageSong: "CleanBanditStronger", isBookmarked: false),
        Song(id: UUID(uuidString: "00000000-0000-0000-0000-000000000026") ?? UUID(), name: "Armin Van Buuren ft Sharon Den Adel - in Out of Love", fileName: "Armin Van Buuren ft Sharon Den Adel - in Out of Love", imageSong: "ArminVanBuuren", isBookmarked: false)
        
    ]
    
    var currentIndex: Int = 0{
        didSet{
            songCurrent = songs[currentIndex]
        }
    }
    
    var player: AVAudioPlayer?
    private var timer: Timer?
    private var progressTimer: Timer?
    var color: Color?
    
    func seek(to progress: Double) {
        guard let player = player else { return }
        let newTime = player.duration * progress
        player.currentTime = newTime
        if !player.isPlaying {
            player.play()
        }
        startProgressUpdate()
    }
    func setupAudio(){
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        }catch{
            print("no active audio: \(error)")
        }
    }
    
    func playSound(song: Song) {

        if let path = Bundle.main.path(forResource: song.fileName, ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                player = try AVAudioPlayer(contentsOf: url)
                durationTime = formatTime(player?.duration ?? 0)
                player?.play()
                startProgressUpdate()
                isPlaying = true
                startRotation()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    
    func togglePlayPause(){
        if isPlaying{
            player?.pause()
            pauseRotation()
        }else{
            player?.play()
            startRotation()
        }
        isPlaying.toggle()
    }
    
    func startRotation(){
        isRotating = true
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            self.rotation += 0.6
        }
        rotation += 360
    }
    
    func pauseRotation(){
        isRotating = false
        timer?.invalidate()
        timer = nil
    }
    
    func stopRotation(){
        timer?.invalidate()
        timer = nil
        rotation = 0
        isRotating = false
    }
    
    func startProgressUpdate() {
        progressTimer?.invalidate()
        progressTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self, let player = self.player else { return }
            DispatchQueue.main.async {
                if player.duration > 0 {
                    self.progress = CGFloat(player.currentTime / player.duration)
                    self.currentTime = self.formatTime(player.currentTime)
                }
            }
        }
    }
    
    func stopSound() {
        player?.stop()
        timer?.invalidate()
        player = nil
        progress = 0
        rotation = 0
        stopRotation()
    }
    
    func backSong(){
        guard let player = player else { return }
        if player.currentTime > 10 {
            player.currentTime = 0
            player.play()
            stopRotation()
        }else {
            if currentIndex > 0{
                currentIndex -= 1
                stopRotation()
            }else {
                currentIndex = songs.count - 1
                startRotation()
            }
        }
        if let song = songCurrent {
            playSound(song: song)
        }
    }
    func nextSong(){
        
        if currentIndex < songs.count - 1 {
            currentIndex += 1
            stopRotation()
        }else{
            currentIndex = 0
            startRotation()
        }
        if let song = songCurrent{
            playSound(song: song)
        }
    }
    
    func fetchBookmarks() {
        let request: NSFetchRequest<SongCDModel> = SongCDModel.fetchRequest()
        
        do {
            let results = try modelContext.fetch(request)
            
            // Dictionary duplikat ederek təhlükəsiz formada cixartmaq
            let bookmarkMap = results.reduce(into: [String: Bool]()){ dictionary, item in
                if let id = item.id{
                    dictionary[id.uuidString] = item.isBookmarked
                }
            }
            // UI update edir
            for (index, song) in songs.enumerated(){
                songs[index].isBookmarked = bookmarkMap[song.id.uuidString] ?? false
            }
        } catch {
            print("Load error: \(error.localizedDescription)")
        }
    }
    
    func toggleBookmark(for song: Song) {
        let request: NSFetchRequest<SongCDModel> = SongCDModel.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", song.id as CVarArg)
        
        do {
            let results = try modelContext.fetch(request)
            
            if let existing = results.first {
                existing.isBookmarked.toggle()
                try modelContext.save()
                if let index = songs.firstIndex(where: { $0.id == song.id }) {
                    songs[index].isBookmarked = existing.isBookmarked
                }
                print(existing.isBookmarked ? "Song bookmarked" : "Song unbookmarked")
                
            } else {
                let newSong = SongCDModel(context: modelContext)
                newSong.id = song.id
                newSong.name = song.name
                newSong.fileName = song.fileName
                newSong.imageSong = song.imageSong
                newSong.isBookmarked = true
                try modelContext.save()
                
                if let index = songs.firstIndex(where: { $0.id == song.id }) {
                    songs[index].isBookmarked = true
                }
            }
            songCurrent = songs[currentIndex]
        } catch {
            print("Core Data error: \(error.localizedDescription)")
        }
    }
}

extension Song {
    var gradient: LinearGradient {
        if let uiImage = UIImage(named: imageSong),
           let dominant = uiImage.dominantColor() {
            let color = Color(dominant)
            return LinearGradient(
                colors: [color, .black.opacity(0.6)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        } else {
            return LinearGradient(
                colors: [.gray, .black],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    }
}

extension UIImage {
    func dominantColor() -> UIColor? {
        guard let ciImage = CIImage(image: self) else { return nil }
        let extent = ciImage.extent
        let context = CIContext()
        
        guard let filter = CIFilter(name: "CIAreaAverage",
                                    parameters: [kCIInputImageKey: ciImage,
                                                 kCIInputExtentKey: CIVector(cgRect: extent)]) else {
            return nil
        }
        
        guard let outputImage = filter.outputImage else { return nil }
        
        var bitmap = [UInt8](repeating: 0, count: 4)
        context.render(outputImage,
                       toBitmap: &bitmap,
                       rowBytes: 4,
                       bounds: CGRect(x: 0, y: 0, width: 1, height: 1),
                       format: .RGBA8,
                       colorSpace: CGColorSpaceCreateDeviceRGB())
        
        return UIColor(red: CGFloat(bitmap[0]) / 255,
                       green: CGFloat(bitmap[1]) / 255,
                       blue: CGFloat(bitmap[2]) / 255,
                       alpha: 1)
    }
}
