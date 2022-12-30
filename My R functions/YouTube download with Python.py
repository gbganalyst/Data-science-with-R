from pytube import Playlist

def download_playlist(link):
    playlist  = Playlist(link)
    for video in playlist.videos: 
        print("Downloading " + video.title)
        
        mp4 = video.streams.filter(file_extension= "mp4").filter(res="720p")
        mp4.first().download()

link = input("Enter the playlist URL: ") 

download_playlist(link)
